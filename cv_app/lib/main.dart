import 'package:flutter/material.dart';

// Klas ki reprezante yon manm nan gwoup la
class GroupMember {
  final String name; // Non manm nan
  final String personalInfo; // Enfòmasyon pèsonèl manm nan
  final String academicBackground; // Fòmasyon akademik manm nan

  // Konstriktè pou kreye yon nouvo manm nan gwoup la
  GroupMember({
    required this.name,
    required this.personalInfo,
    required this.academicBackground,
  });
}

// Ekran ki afiche detay sou yon sijè done
class DetailScreen extends StatelessWidget {
  final String title; // Tit ekran an
  final String detail; // Detay sijè a

  // Konstriktè pou kreye yon nouvo ekran detay
  DetailScreen({required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Text(detail),
      ),
    );
  }
}

// Ekran ki afiche detay sou yon manm nan gwoup la
class MemberDetailScreen extends StatelessWidget {
  final GroupMember member; // Manm nan gwoup la

  // Konstriktè pou kreye yon nouvo ekran detay manm nan
  MemberDetailScreen({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(member.name),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Personal Information'), // Tit enfòmasyon pèsonèl
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    title: 'Personal information', // Tit ekran detay la
                    detail: member.personalInfo, // Detay enfòmasyon pèsonèl
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Academic Background'), // Tit fòmasyon akademik
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    title: 'Academic Background', // Tit ekran detay la
                    detail: member.academicBackground, // Detay fòmasyon akademik
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

// Ekran ki afiche tout manm nan gwoup la nan yon grid
class GroupMembersScreen extends StatelessWidget {
  final List<GroupMember> groupMembers; // Lis manm nan gwoup la

  // Konstriktè pou kreye yon nouvo ekran manm nan gwoup la
  GroupMembersScreen({
    required this.groupMembers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Members'), // Tit ekran an
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true, // pou réduire la taille du GridView en fonction de son contenu
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 kolòn nan grid la
            crossAxisSpacing: 8.0, // Espas ant kolòn yo
            mainAxisSpacing: 8.0, // Espas ant liy yo
          ),
          itemCount: groupMembers.length, // Kòman manm nan gwoup la
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MemberDetailScreen(member: groupMembers[index]),
                  ),
                );
              },
              child: Container(
                height: 100, // Hauteur fixe pou chak kontènè
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent), // Borè kontènè yo
                  borderRadius: BorderRadius.circular(8.0), // Kourb kontènè yo
                ),
                child: Center(
                  child: Text(
                    groupMembers[index].name,
                    style: TextStyle(fontSize: 16.0), // Fòm aksepte pou tèks la
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, GroupMember> groupMemberData = {
    "Aliano CHARLES": GroupMember(
      name: 'Aliano CHARLES',
      personalInfo:
          'Age: 23 ans \n Adresse: Clercine 22 imp cherubin \n Phone: +509 3846 0432',
      academicBackground: 'Bachelor\'s in Computer Science',
    ),
    "Aurelus Wisner": GroupMember(
      name: 'Aurelus Wisner',
      personalInfo:
          'Age: 23 ans \n Adresse: Clercine 22 imp cherubin \n Phone: +509 3846 0432',
      academicBackground: 'Bachelor\'s in Computer Science',
    ),
    "Florestal Jean Daniel": GroupMember(
      name: 'Florestal Jean Daniel',
      personalInfo:
          'Age: 23 ans \n Adresse: Clercine 22 imp cherubin \n Phone: +509 3846 0432',
      academicBackground: 'Bachelor\'s in Computer Science',
    ),
    "Aishael Picard": GroupMember(
      name: 'Aishael Picard',
      personalInfo:
          'Age: 23 ans \n Adresse: Clercine 22 imp cherubin \n Phone: +509 3846 0432',
      academicBackground: 'Bachelor\'s in Computer Science',
    ),
     "Estinvil Clivens": GroupMember(
      name: 'Estinvil Clivens',
      personalInfo:
          'Age: 23 ans \n Adresse: Clercine 22 imp cherubin \n Phone: +509 3846 0432',
      academicBackground: 'Bachelor\'s in Computer Science',
    ),
  };

  void addMember(GroupMember newMember) {
    groupMemberData[newMember.name] = newMember;
  }

  @override
  Widget build(BuildContext context) {
    final List<GroupMember> groupMemberlist = groupMemberData.values.toList();
    return MaterialApp(
      title: 'Cv App',
      theme: ThemeData(primaryColor: Colors.blue),
      home: GroupMembersScreen(
        groupMembers: groupMemberlist,
      ),
    );
  }
}
