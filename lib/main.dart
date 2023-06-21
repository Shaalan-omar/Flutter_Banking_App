import 'package:flutter/material.dart';
import 'customer_list.dart';
void main() {
  runApp(
     MyApp(
      
     )
  );
}

class User{
  final String transaction_name;
  final String transaction_id;
  final String transaction_urlImage;


const User({
  required this.transaction_name,
  required this.transaction_id,
  required this.transaction_urlImage,
});
}

class MyApp extends StatelessWidget {
 List<User> users = [
  const User(
    transaction_name:  'Netflix',
    transaction_id: 'ID: 900194876',
    transaction_urlImage: 'https://i.ytimg.com/vi/GV3HUDMQ-F8/maxresdefault.jpg',
    ),
  const User(
    transaction_name:  'Hulu',
    transaction_id: 'ID: 900192343',
    transaction_urlImage: 'https://d12jofbmgge65s.cloudfront.net/wp-content/uploads/2022/04/app_review_Hulu_wp_upload.png',
    ),
  const User(
    transaction_name:  'Twitch/payments',
    transaction_id: 'ID: 900197767',
    transaction_urlImage: 'https://www.freepnglogos.com/uploads/twitch-app-logo-png-3.png',
    ),
  const User(
    transaction_name:  'Lono Restaurant',
    transaction_id: 'ID: 800124345',
    transaction_urlImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbp0OxXzrRkjDtK3Ge6X6goSmhJL1MoDmXKg&usqp=CAU',
    ),
 ];
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(users: users),
   );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.users,
  });

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      //  floatingActionButton: Transform.scale( scale: 0.8, child: FloatingActionButton(onPressed: () {}, backgroundColor: Colors.amber,),),
       
       backgroundColor: Colors.black87,
    body: SafeArea(
     child: Column( 
        children: [   
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
              Row( children: [
                Container( //CHILD_1
                  margin: const EdgeInsets.all(10.0),
                  child:  
                      const CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage("images/shaalan's_pic.jpeg"),
                    ),
                  ),
              
                      const Column(
                        children: [
                          Text("Omar Shaalan",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,) ,
                          ),
                          SizedBox(height: 4,),
                          Text("PREMIUM",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 115, 114, 114), fontSize: 12) ,
                      ),
                        ],
                    ),
              ]),
          ]),
           
        Container(
                alignment: Alignment.topRight,
                child:
                  SizedBox(
                  height: 45,
                  width: 45,
                    child:
                    ElevatedButton(
                  onPressed: () {},
                  
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(), backgroundColor: const Color.fromARGB(95, 108, 105, 105), //<-- SEE HERE
                    padding: const EdgeInsets.all(0),
                    elevation: 3,
                    //side: const BorderSide( color:Color.fromARGB(255, 171, 171, 171)),
                    
                    
                    ),
                    child: const Icon( //<-- SEE HERE
                    Icons.notifications_active_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              ),
        ]
      ),
      const SizedBox(height: 24,),
           Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 12),
                alignment: Alignment.topLeft,
                  child: const Text("Total Balance",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 115, 114, 114), fontSize: 12) ,
                      ),
              ),
           const SizedBox(height: 7,),
              Container(
                margin: const EdgeInsets.only(left: 12),
                 alignment: Alignment.topLeft,
                    child: const Text("\$40,000.00 USD",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(200, 194, 237,78), fontSize: 27) ,
                      ),
              ),
            ],
          ),
          
          const SizedBox(height: 15,),

          const Divider(
                      color: Colors.grey
          ),
          const SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
              //first button
              Column(
              children: [
              SizedBox(
                height: 50,
                width: 50,
                  child:
                 ElevatedButton(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const custList()),
  );
                  },
                
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), backgroundColor: const Color.fromARGB(95, 108, 105, 105), //<-- SEE HERE
                  padding: const EdgeInsets.all(0),
                  elevation: 3,
                  //side: BorderSide(width:2, color:Color.fromARGB(255, 171, 171, 171)),
                  
                  
                  ),
                  child: const Icon( //<-- SEE HERE
                  Icons.ios_share,
                  color: Colors.white,
                  size: 24,
                  
                ),  
                  
                ),
            
              ),

              const SizedBox(height: 10,),
               const Text("Transfer Money",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12) ,
                    ),
            ]),
              
              //second button 
                    //first button
              Column(
              children: [
              SizedBox(
                height: 50,
                width: 50,
                  child:
                 ElevatedButton(
                onPressed: () {},
                
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), backgroundColor: const Color.fromARGB(95, 108, 105, 105), //<-- SEE HERE
                  padding: const EdgeInsets.all(0),
                  elevation: 3,
                  //side: BorderSide(width:2, color:Color.fromARGB(255, 171, 171, 171)),
                  
                  
                  ),
                  child: const Icon( //<-- SEE HERE
                  Icons.account_tree_outlined,
                  color: Colors.white,
                  size: 24,
                  
                ),  
                  
                ),
            
              ),

              const SizedBox(height: 10,),
               const Text("Recent Activity",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12) ,
                    ),
            ]),
            //third button
                   //first button
              Column(
              children: [
              SizedBox(
                height: 50,
                width: 50,
                  child:
                 ElevatedButton(
                onPressed: () {},
                
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), backgroundColor: const Color.fromARGB(95, 108, 105, 105), //<-- SEE HERE
                  padding: const EdgeInsets.all(0),
                  elevation: 3,
                  //side: BorderSide(width:2, color:Color.fromARGB(255, 171, 171, 171)),
                  
                  
                  ),
                  child: const Icon( //<-- SEE HERE
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 24,
                  
                ),  
                  
                ),
            
              ),

              const SizedBox(height: 10,),
               const Text("More Details",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12) ,
                    ),
            ]),

            ],
          ),
          const SizedBox(height: 50,),

          Container(
            margin: const EdgeInsets.only(left: 12),
            alignment: Alignment.topLeft,
            child:
             const Text("Recent Transactions",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20) ,
                    ),
          ),
         const SizedBox(height: 25,),
            Container(
              color: Colors.transparent,
              //alignment: Alignment.center,
              child: 
               SizedBox(height: 263, child: ListView.builder(itemCount: users.length, itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  color:  Colors.black87,
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(user.transaction_urlImage),
                      ),
                    title: Text( user.transaction_name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20) ,),
                    subtitle: Text(user.transaction_id, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 11) ,),
                    //trailing: const Icon(Icons.arrow_forward, color: Colors.white,),
                    
                  ),
                );
              },
            ),
          ),  
            ),


        ],
      ), 
     ),
     );
  }
}

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({
    Key? key,
    required this.user,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(user.transaction_name),
    ),
    body: const Center(
      child: Column(
        children: [
            //Future Implementation of quick payment [clicking on the arrow in card and going to the transfer screen directly]
        ],
      ),
    ),
  );
  }






/////////////////////////////////////////////////
