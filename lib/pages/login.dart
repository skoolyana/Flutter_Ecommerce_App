import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';


class Login extends StatefulWidget {

@override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googlesignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
   late SharedPreferences preferences;
  bool loading = false;
  bool isLoggedin = false;
  @override
  void initState()
  {
    super.initState();

    isSignedIn();
  }


  void isSignedIn() async {

    setState((){
      loading  = true;
    });

    preferences = await SharedPreferences.getInstance();

    isLoggedin = await googlesignIn.isSignedIn();
    if(isLoggedin)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
      }
    setState(() {
      loading = false;
    });
  }

  Future handleSignin() async{
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount? googleUser = await googlesignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,

    );

    final UserCredential authResult =
    await firebaseAuth.signInWithCredential(credential);
    final User? fireBaseUser = await authResult.user;

    if(fireBaseUser!=null)
      {
        final QuerySnapshot result = await FirebaseFirestore.instance.collection
          ("users").where("id",isEqualTo: fireBaseUser.uid).get();
        
        final List<DocumentSnapshot> docs = result.docs;
        if(docs.length==0)
          {
            FirebaseFirestore.instance.collection("users").doc(fireBaseUser.uid)
                .set({
                "id":fireBaseUser.uid,
                "username":fireBaseUser.displayName,
                "profilePicture":fireBaseUser.photoURL,

            });

            await preferences.setString("id", fireBaseUser.uid);

            var strdisplayName = fireBaseUser.displayName??"";
            var strphotoURL = fireBaseUser.photoURL??"";
            await preferences.setString("username", strdisplayName);
            await preferences.setString("photoURL", strphotoURL);
          }
          else {

         await preferences.setString("id", docs[0]['id']);
          await preferences.setString("username", docs[0]['username']);
          await preferences.setString("photoURL", docs[0]['photoURL']);
        }
        Fluttertoast.showToast(msg: "Logged in");
        setState(() {
          loading= false;
        });
      }
      else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[

          Image.asset('images/back.jpg',fit: BoxFit.fill,
            width: double.infinity,
            height:double.infinity,),
          Container(
            color: Colors.red.withOpacity(0.1),
            width: double.infinity,
            height:double.infinity,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(

              alignment: Alignment.center,
              child: Center(
                child: Form(
                  key: _formKey,

                  child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.8),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                            hintText: "Email",
                            icon: Icon(Icons.email),

                            labelText: "Email"),

                            validator: (value){
                              if(value!.isEmpty)
                              {
                                Pattern pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                                RegExp rexp = new RegExp(pattern.toString());
                                if(!rexp.hasMatch(value))
                                {
                                  return 'Please make sure your email address is valid';
                                }
                                else
                                  return null;
                              }
                            },

                            keyboardType: TextInputType.emailAddress,


                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.8),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                hintText: "Password",
                                icon: Icon(Icons.lock),
                                labelText: "Password"),
                            validator: (value){

                              if(value!.isEmpty)
                                {
                                  return "The password field cannot be empty";

                                }
                              else if(value.length< 6)
                                {
                                  return "The password has to be atleast 6 characters long";
                                }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue,
                        elevation: 0.0,
                          child: MaterialButton( onPressed: (){},
                          minWidth: MediaQuery.of(context).size.width,
                            child: Text("Login",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19.0),),
                          )
                      ),
                    ), Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red,
                          elevation: 0.0,
                          child: MaterialButton( onPressed: (){handleSignin();},

                            minWidth: MediaQuery.of(context).size.width,
                            child: Text("Sign In with Google",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19.0),),
                          )
                      ),
                    )



                  ],

                  ),
                ),
              ),

            ),
          ),


          Visibility(
              visible: loading?? true,
              child: Center(
                child: Container(
          color: Colors.white.withOpacity(0.9),
            child:CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            )
          ),
              )
          )

        ],

      ),

    );
  }
}

