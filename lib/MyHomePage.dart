import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seetest_device_setup/UploadApp.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String seetestAccessKey;
  String nexusUrl;
  String deviceId;
  String registrationsDetails;
  String environment;
  UploadApp uploadApp = new UploadApp();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.cloud),
                      hintText: 'Enter Your Seetest Cloud Access Key',
                      labelText: 'Seetest Access key',
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Seetest Access key is Required';
                      }

                      return null;
                    },
                    onSaved: (String value) {
                      seetestAccessKey = value;
                    },
                  ),
                  new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.build_outlined),
                        hintText: 'Enter The Nexus Build link',
                        labelText: 'Nexus url',
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Nexus url is Required';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        nexusUrl = value;
                      }),
                  new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.mobile_friendly),
                        hintText: 'Enter the Device id to install the build',
                        labelText: 'Device Id',
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Device Id is Required';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        deviceId = value;
                      }),
                  new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.app_registration),
                        hintText:
                            'Enter Sort Code, Account Number, First Name, Last Name & Card no. of customer',
                        labelText: 'Registration Details',
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Registration Details is Required';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        registrationsDetails = value;
                      }),
                  new TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.phonelink_setup),
                        hintText: 'Environment e.g PIT1,RIT6',
                        labelText: 'Environment',
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Environment is Required';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        environment = value;
                      }),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }

                            _formKey.currentState.save();
                            uploadApp.uploadApp(seetestAccessKey, nexusUrl,
                                deviceId, registrationsDetails, environment);

                            print(seetestAccessKey);
                            print(nexusUrl);
                            print(deviceId);
                            print(registrationsDetails);
                            print(environment);
                          })),
                ],
              ))),
    );
  }
}
