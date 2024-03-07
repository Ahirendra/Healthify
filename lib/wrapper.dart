import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthify/models/doc.dart';
import 'package:healthify/models/user.dart';
import 'package:healthify/user/auth/signup.dart';
import 'package:healthify/user/navigation.dart';
import 'package:healthify/welcome/welcome.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    
    //final user=Provider.of<User1?>(context);
    final doc=Provider.of<Doc?>(context);
    if(doc==null)
      {
        return Welcome();
      }
    //else if(doc==null) return Welcome();

    //else if (doc != null)return Navigation();
    else {
      return Navigation();
    }
  }
}