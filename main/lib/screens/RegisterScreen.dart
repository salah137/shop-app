import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_and_shop_app/screens/LoginScreen.dart';
import 'package:social_and_shop_app/shared/cubit/AppCubit.dart';
import 'package:social_and_shop_app/shared/cubit/AppStates.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController username = new TextEditingController();
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      builder: (ctx, state) {
        AppCubit cubit = BlocProvider.of(ctx);

        return Scaffold(
          body: Form(
            key: formkey,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(
                      "assets\images\photo-1569180880150-df4eed93c90b.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                SingleChildScrollView(
                                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    height: 700,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 80),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: 'email',
                          ),
                          validator: (v) {
                            if (!v!.contains("@")) {
                              return 'Entre The Right Form Of Emails';
                            } else if (v.isEmpty || v == null) {
                              return 'Return Your Email';
                            }

                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "password",
                          ),
                          validator: (v) {
                            if (v!.isEmpty || v == null) {
                              return 'Return Your Password';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.supervised_user_circle_rounded),
                            hintText: "user name",
                          ),
                          validator: (v) {
                            if (v!.isEmpty || v == null) {
                              return 'Return Your user Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: MaterialButton(
                              onPressed: () {
                                if(formkey.currentState!.validate())
                                cubit.signUp(
                                  email.text,
                                  password.text,
                                  username.text,
                                );
                              },
                              child: ConditionalBuilder(
                                condition: state is LoadingState,
                                builder: (ctx) {
                                  return CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                },
                                fallback: (ctx) => Text(
                                  "Done",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 30),
                                ),
                              ),
                            ),
                          ),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You Have An Account ! ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 15),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (builder) => LoginScreen()),
                                    (route) => false);
                              },
                              child: Text(
                                'Sign In Now',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontSize: 15,
                                      color: Colors.blue,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (ctx, state) {},
    );
  }
}
