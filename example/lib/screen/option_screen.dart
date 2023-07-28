
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class OptionScreen extends StatelessWidget {
  // const OptionScreen({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    key: _key,
      body: Container(
        child: Center(
        child: ElevatedButton(
          child: Text('test'),
          onPressed: ()async{

            if(await checkIfPermissionGranted()){
              SnackBar snackBar = SnackBar(content: Text('허용 되었음'),);
            }
            else{
              SnackBar snackBar = SnackBar(content: Text('허용 안됌'),
              action: SnackBarAction(
                label:  'go to settting',
                onPressed: (){

                  AppSettings.openAppSettings();
                },
              ),);
            }
          },
        ),
      )
      ),
    );
  }

  Future<bool> checkIfPermissionGranted() async{
    Map<Permission,PermissionStatus> statuses = await [Permission.camera].request();

    bool permitted = true;

    statuses.forEach((permission , permissionStatus) {
      if(!permissionStatus.isGranted) permitted = false;
    });

    return permitted;
  }

}
