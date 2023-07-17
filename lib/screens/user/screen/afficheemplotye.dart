import 'package:appmobile/screens/user/screen/service/auth_client.dart';
import 'package:flutter/material.dart';

import '../../../module/employe.dart';



class EmployeScreen extends StatefulWidget {
  static const String routeName = "/employe-liste";
  
  @override
  State<EmployeScreen> createState() => _EmployeScreenState();
}

class _EmployeScreenState extends State<EmployeScreen> {
  List<Employe>? employes;
  final BoutiqueServices authService = BoutiqueServices();

  @override
  void initState() {
    super.initState();
    fetchAllEmployes();
  }

  fetchAllEmployes() async {
    employes = await authService.fetchAllemploye(context);
    setState(() {});
  }

void deleteEmploye(Employe employe, int index) {
  authService.deleteemploye(
    context: context,
    employe: employe,
    onSuccess: () {
      setState(() {
        employes!.removeAt(index);
      });
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
         backgroundColor: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
         
     centerTitle: true,
    
      title:Column(
        children:[
       Text(
        "Employee List",
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
     
        ]
      ),  
        actions: [
          Padding(
            padding:const EdgeInsets.only(right:20,top:20),

            
            
          )
        ],
      ),    
   body:  DataTable(
    columns: const <DataColumn>[
      DataColumn(
        label: Text(
          '',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 5),
        ),
      ), 
      DataColumn(
        label: Text(
          'Name',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 6),
        ),
      ),
      DataColumn(
        label: Text(
          'Email',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 6),
        ),
      ),
      DataColumn(
        label: Text(
          'Telephone',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 6),
        ),
      ),
      DataColumn(
        label: Text(
          'Address',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 6),
        ),
      ),
      
    ],
    rows: employes != null
        ? employes!.asMap().entries.map((entry) {
            final int index = entry.key;
            final Employe employe = entry.value;
            return DataRow(
              cells: <DataCell>[
              DataCell(
                      ElevatedButton(
                        onPressed: () => deleteEmploye(employe, index),
                        child: Text(
                          'Delete',
                          style: TextStyle(fontSize: 5),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                                minimumSize: Size(15, 15), // Adjust the minimum size of the button
)
                      ),
              )
            ,  DataCell(Text(
                  employe.name,
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 6),
                )),
                DataCell(Text(
                  employe.email,
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 6),
                )),
                DataCell(Text(
                  employe.telephone.toString(),
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 6),
                )),
                DataCell(Text(
                  employe.address,
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 6),
                )),
           
              ],
            );
          }).toList()
        : [],
   )
   );
}
    
}

