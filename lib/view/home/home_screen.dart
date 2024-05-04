import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/auth_controller.dart';
import '../../controller/user_controller.dart';
import '../auth/login_screen.dart';
import 'widgets/add_user_dailog.dart';
import 'widgets/sort_bottom_sheet.dart';
import 'widgets/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xffebebeb),
        appBar: AppBar(
          toolbarHeight: mq.height * 0.1,
          backgroundColor: Colors.black,
          leadingWidth: double.infinity,
          leading: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.location_on,
                size: 24,
                color: Colors.white,
              ),
              const SizedBox(width: 4),
              Text(
                'Nilambur',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17),
                overflow: TextOverflow.visible,
              ),
            ],
          ),
          actions: [
            Consumer<AuthController>(
                builder: (context, authProvider, child) => IconButton(
                    onPressed: () {
                      authProvider
                          .signOut()
                          .then((value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              )));
                    },
                    icon: const Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    ))),
            const SizedBox(
              width: 3,
            )
          ],
        ),
        body: Consumer<UserController>(
          builder: (context, userProvider, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: userProvider.searchController,
                              onChanged: (value) {
                                userProvider.search(value);
                              },
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(left: mq.width * 0.03),
                                  child: const Icon(
                                    Icons.search_rounded,
                                    size: 30,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 16),
                                hintText: '  search by name',
                                hintStyle: GoogleFonts.montserrat(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 2,
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: mq.width * 0.02,
                          ),
                          IconButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(11))),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Colors.black)),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    const SortBottomSheet(), // Sorting Bottom Sheet
                              );
                            },
                            icon: const Icon(
                              Icons.filter_list_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Users Lists',
                          style: GoogleFonts.montserrat(
                              fontSize: 17, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 7),
                    child: userProvider.isFetchingData
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 2,
                            ),
                          )
                        : userProvider.filterUsersList.isEmpty
                            ? const Center(
                                child: Text(
                                  'No users found.',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            : ListView.builder(
                                itemCount: userProvider.filterUsersList.length,
                                itemBuilder: (context, index) {
                                  final data =
                                      userProvider.filterUsersList[index];
                                  return UserCard(
                                    user: data,
                                  ); // user card
                                },
                              ),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: SizedBox(
          height: mq.height * 0.10,
          width: mq.width * 0.15,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              shape: const CircleBorder(),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AddUserDailog();
                  },
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
