import 'package:flutter/material.dart';

//Widgets
import './alertIcon.dart';
import './slackUserImage.dart';
import './slackUsername.dart';

//Api
import '../API/api.dart';

//Model
import '../model/post_model.dart';
// import '../widgets/contact_modal.dart';

//Statemanagement
import '../model/user_model.dart';
import '../widgets/dialog.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  final String visitor;

  UserCard(this.user, this.visitor);

  _handleEvent() {
    Post newPost = new Post(name: user.name, visitor: visitor);
    createPost(body: newPost.toMap());
  }

  // dialog.getDialog(context, user).then((onValue) {
  //   // print(onValue);
  // })
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => _handleEvent(),
        child: Row(
          children: <Widget>[
            SlackUserImage(user.image),
            SlackUsername(user.name),
            AlertIcon()
          ],
        ),
      ),
    );
  }
}
