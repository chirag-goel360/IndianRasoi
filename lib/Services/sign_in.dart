//Dont edit this file
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
//Google login
Future<String> signInwithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
    idToken: googleSignInAuthentication.idToken,
    accessToken: googleSignInAuthentication.accessToken,
  );
  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);
  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  return 'signInwithGoogle succeeded: $user';
}

//google logout
void signOutGoogle() async {
  await googleSignIn.signOut();
  print("User Sign Out");
}

//Include Strings.xml file in main-res-values
//Facebook login
FacebookLogin fblogin = FacebookLogin();
Future<String> facebookLogin() async {
  fblogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  try {
    final FacebookLoginResult facebookLoginResult =
        await fblogin.logInWithReadPermissions(
      ['email', 'public_profile'],
    );
    if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
      final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: facebookAccessToken.token,
      );
      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      return 'signInwithFacebook succeeded: $user';
    }
  } catch (e) {
    print(e);
  }
  return null;
}

//facebook logout
void facebookLoginout() async {
  await _auth.signOut();
  await fblogin.logOut();
}
