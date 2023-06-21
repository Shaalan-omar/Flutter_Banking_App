
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransferPage extends StatelessWidget {
  final User user;
  const TransferPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
  backgroundColor: Colors.black87,
    appBar: AppBar(
      title: const Text("Transfer Money", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
      backgroundColor: Colors.black87,
      
    ),
    body: Center(
      child: Column(
        children: [

           Container(
                color: Colors.transparent,
                //alignment: Alignment.center,
                child: 
                 SizedBox(height: 263,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(user.urlAvatar),
                        ),
                      
                 ),
                  
           ),
          
          const SizedBox(height: 5),

          Text(
            "Transfering Money to ${user.username}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 20,),
              ),

              const SizedBox(height: 60),
              TextField(
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
             inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
]             ,
              keyboardType: TextInputType.number, // Set the keyboard type to number
              decoration: const InputDecoration(
                hintText: 'Enter a number',
                hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                )
              ),
            ),          
          
          //ClipRRect(
          //   borderRadius: BorderRadius.circular(10),
          //   child: 
          //   Image.network(
          //   user.urlAvatar,
          //   height: 400,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          // ),
          

          const SizedBox(height: 16,),
          Text(
            user.username,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                //first button
                Column(
                children: [
                SizedBox(
                  height: 50,
                  width: 300,
                    child:
                   ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const custList()));
                    },
                  
                  style: ElevatedButton.styleFrom(
                    //shape: const CircleBorder(), //<-- SEE HERE
                    //padding: const EdgeInsets.all(0),
                    backgroundColor: const Color.fromARGB(95, 108, 105, 105),
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
            ],
          ),
            const SizedBox(height: 50,),
        ],
      ),
    )
  );
}

class UserPage extends StatelessWidget {
  final User user;
  const UserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
  backgroundColor: Colors.black87,
    appBar: AppBar(
      title: Text(user.username, style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
      ),
      backgroundColor: Colors.black87,
      
    ),
    body: Center(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: 
            Image.network(
            user.urlAvatar,
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ),
          

          const SizedBox(height: 16,),
          Text(
            user.username,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransferPage(user:user))
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
                    Icons.history,
                    color: Colors.white,
                    size: 24,
                    
                  ),  
                    
                  ),
              
                ),

                const SizedBox(height: 10,),
                 const Text(" Transaction History",
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
                 const Text("Account Details",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12) ,
                      ),
              ]),

              ],
            ),
            const SizedBox(height: 50,),
        ],
      ),
    )
  );
}

void main() {
  runApp(
     const custList(
      
     )
  );
}

class User{
  final String username;
  final String email;
  final String urlAvatar;


const User({
  required this.username,
  required this.email,
  required this.urlAvatar,
});
}

class custList extends StatefulWidget {

    const custList({super.key});

  @override
  State<custList> createState() => _custListState();
}

class _custListState extends State<custList> {
  late final List<User> users = [
  const User(
    username:  'Sarahx',
    email: 'Sarah.Abdelhamid@hohomail.com',
    urlAvatar: 'https://media.istockphoto.com/id/1420486889/photo/candid-portrait-of-young-middle-eastern-digital-native.jpg?s=612x612&w=0&k=20&c=SV7ZhKg7qCeL6oYZGBaIxqfTTrQZu08kndvIKqdL_PI=',
    ),
  const User(
    username:  'Jennifer',
    email: 'Jen.mat@hohomail.com',
    urlAvatar: 'https://media.istockphoto.com/id/1487545695/photo/a-woman-is-exploring-the-city-at-sunset.jpg?s=612x612&w=0&k=20&c=o8FvrCJcAV02p14RRCpcLmlBY-kPN84FukC05QUH-hg=',
    ),
  const User(
    username:  'Mo',
    email: 'Mo.Jim@hohomail.com',
    urlAvatar: 'https://media.istockphoto.com/id/1400280368/photo/happy-businessman-working-on-his-laptop-at-home-handsome-businessman-reading-an-email-on-his.webp?b=1&s=170667a&w=0&k=20&c=mc9FiePkCPzKWRyexNf2lMo9BkDej_OpNloSDMNsutM=',
    ),
  const User(
    username:  'AboAli',
    email: 'Abo.Ai@hohomail.com',
    urlAvatar: 'https://media.istockphoto.com/id/848624258/photo/portrait-of-man-using-laptop-at-desk-in-office.jpg?s=612x612&w=0&k=20&c=HeMD48ZuWPdsa86kbBVgqcPZB9WPJmdH_Liv4_NJelw=',
    ),
    const User(
    username:  'Jacob',
    email: 'Jacob.Abdelhamid@hohomail.com',
    urlAvatar: 'https://media.istockphoto.com/id/1390884026/photo/young-man-on-a-taking-selfie-at-home-camera-point-of-view.webp?b=1&s=170667a&w=0&k=20&c=BTUIZ3qvB2y7IO-ThRmeB1tTOUlhWvO4AipB2fgTJ18=',
    ),
  const User(
    username:  'Jenny',
    email: 'Jenny.mat@hohomail.com',
    urlAvatar: 'https://media.istockphoto.com/id/1437816897/photo/business-woman-manager-or-human-resources-portrait-for-career-success-company-we-are-hiring.webp?b=1&s=170667a&w=0&k=20&c=YQ_j83pg9fB-HWOd1Qur3_kBmG_ot_hZty8pvoFkr6A=',
    ),
  const User(
    username:  'Mona',
    email: 'Mona.m@hohomail.com',
    urlAvatar: 'https://media.istockphoto.com/id/1402667894/photo/energy-lecture-screen.webp?b=1&s=170667a&w=0&k=20&c=4IN-1IUvtrMK3h8fnrWf490o5KzoXfDFd6gL3Rbn5Ak=',
    ),
  const User(
    username:  'Zack',
    email: 'Zack.Li@hohomail.com',
    urlAvatar: 'https://images.unsplash.com/photo-1531384441138-2736e62e0919?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ),
 ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         backgroundColor: Colors.black87,
      body: SafeArea(
        child: 
              Column(
                children: [
                  Container(
                color: Colors.transparent,
                //alignment: Alignment.center,
                child: 
                 SizedBox(height: height*0.9, child: ListView.builder(itemCount: users.length, itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    color:  Colors.black87,
                    child: ListTile(
                        leading: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(user.urlAvatar),
                        ),
                      title: Text( user.username, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20) ,),
                      subtitle: Text(user.email, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 11) ,),
                      trailing: const Icon(Icons.arrow_forward, color: Colors.white,),
                      
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserPage(user:user))
                    );
                      }
                    ),
                  );
                },
              ),
            ),  
              ),
                ],
              ),
      ),
    ),
  );
}
} 

