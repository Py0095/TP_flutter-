import 'package:flutter/material.dart';

class GroupMember {
  final String name;
  final String personalInfo;
  final String academicBackground;

  GroupMember(
      {required this.name,
      required this.personalInfo,
      required this.academicBackground});
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String detail;

  DetailScreen({required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(detail),
      ),
    );
  }
}

class MemberDetailScreen extends StatelessWidget {
  final GroupMember member;
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
            title: Text('Personal Information'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                          title: 'Personal information',
                          detail: member.personalInfo)));
            },
          ),
          ListTile(
            title: Text('Academic Bacground'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                          title: 'Academic Bacground',
                          detail: member.academicBackground)));
            },
          )
        ],
      ),
    );
  }
}

class GroupMembersScreen extends StatelessWidget {
  final List<GroupMember> groupMembers;

  GroupMembersScreen({
    required this.groupMembers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Members'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true, // pour réduire la taille du GridView en fonction de son contenu
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: groupMembers.length,
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
                height: 100, // hauteur fixe pour chaque conteneur
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    groupMembers[index].name,
                    style: TextStyle(fontSize: 16.0),
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
        academicBackground: 'Bachelor\'s in Computer Science'),
    "Aurelus Wisner": GroupMember(
        name: 'Aurelus Wisner',
        personalInfo:
            'Age: 23 ans \n Adresse: Clercine 22 imp cherubin \n Phone: +509 3846 0432',
        academicBackground: 'Bachelor\'s in Computer Science'),
    "Florestal Jean Daniel": GroupMember(
        name: 'Florestal Jean Daniel',
        personalInfo:
            'Age: 23 ans \n Adresse: Clercine 22 imp cherubin \n Phone: +509 3846 0432',
        academicBackground: 'Bachelor\'s in Computer Science'),
    "Aishael Picard": GroupMember(
        name: 'Aishael Picard',
        personalInfo:
            'Age: 23 ans \n Adresse: Clercine 22 imp cherubin \n Phone: +509 3846 0432',
        academicBackground: 'Bachelor\'s in Computer Science')
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
        ));
  }
}
