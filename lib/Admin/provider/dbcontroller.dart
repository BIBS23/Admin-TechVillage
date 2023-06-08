import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceController extends ChangeNotifier {
  String? docId;

  // Collection Referance of Auto

  CollectionReference collectionRefAuto = FirebaseFirestore.instance
      .collection('services')
      .doc('auto')
      .collection('worker');

  // add data of Auto

  void addAuto(String name, String exp, String availability, String profimg,
      String about, String phone, bool isTrue) async {
    await collectionRefAuto.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of plumber

  CollectionReference collectionRefPlumber = FirebaseFirestore.instance
      .collection('services')
      .doc('plumber')
      .collection('worker');

  // add data of plumber

  void addPlumber(String name, String exp, String availability, String profimg,
      String about, String phone, bool isTrue) async {
    await collectionRefPlumber.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Tailor

  CollectionReference collectionRefTailor = FirebaseFirestore.instance
      .collection('services')
      .doc('tailor')
      .collection('worker');

  // add data of Tailor

  void addTailor(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefTailor.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Doctor

  CollectionReference collectionRefDoctor = FirebaseFirestore.instance
      .collection('services')
      .doc('healthworkers')
      .collection('doctors');

  // add data of Doctor

  void addDoctor(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefDoctor.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Dentist

  CollectionReference collectionRefDentist = FirebaseFirestore.instance
      .collection('services')
      .doc('healthworkers')
      .collection('dentist');

  //add data of Dentist

  void addDentist(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefDentist.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Ashaworker

  CollectionReference collectionRefAshaworker = FirebaseFirestore.instance
      .collection('services')
      .doc('healthworkers')
      .collection('ashaworker');

  //add data of AshaWorker

  void addAshaworker(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefAshaworker.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }
  // collection Referance of  HomeNurse

  CollectionReference collectionRefHomeNurse = FirebaseFirestore.instance
      .collection('services')
      .doc('healthworkers')
      .collection('homenurse');

  //add data of HomeNurse

  void addHomeNurse(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefHomeNurse.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Nurse

  CollectionReference collectionRefNurse = FirebaseFirestore.instance
      .collection('services')
      .doc('healthworkers')
      .collection('nurse');

  //add data of Nurse

  void addNurse(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefNurse.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of housekeepers

  CollectionReference collectionRefHouseKeepers = FirebaseFirestore.instance
      .collection('services')
      .doc('housekeepers')
      .collection('worker');

  //add data of Housekeeprs

  void addHouseKeepers(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefHouseKeepers.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Electrician

  CollectionReference collectionRefElectrician = FirebaseFirestore.instance
      .collection('services')
      .doc('electricians')
      .collection('worker');

  //add data of Electrician

  void addElectrician(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefElectrician.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Mason

  CollectionReference collectionRefMason = FirebaseFirestore.instance
      .collection('services')
      .doc('localworkers')
      .collection('mason');

  //add data of Mason

  void addMason(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefMason.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of lawnmover

  CollectionReference collectionRefLawnMover = FirebaseFirestore.instance
      .collection('services')
      .doc('localworkers')
      .collection('lawnmover');

  //add data of lawnmover

  void addLawnMover(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefLawnMover.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Constructionworker

  CollectionReference collectionRefConstructionWorker = FirebaseFirestore
      .instance
      .collection('services')
      .doc('localworkers')
      .collection('constructionworker');

  //add data of ConstructionWorker

  void addConstructionWorker(String name, String exp, String availability,
      String about, String phone, String profimg, bool isTrue) async {
    await collectionRefConstructionWorker.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of FieldWorker

  CollectionReference collectionRefFieldWorker = FirebaseFirestore.instance
      .collection('services')
      .doc('localworkers')
      .collection('fieldworker');

  //add data of FieldWorker

  void addFieldWorker(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefFieldWorker.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Tutor

  CollectionReference collectionRefTutor = FirebaseFirestore.instance
      .collection('services')
      .doc('tutors')
      .collection('worker');

  //add data of Tutor

  void addTutor(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefTutor.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Mechanic

  CollectionReference collectionRefMechanic = FirebaseFirestore.instance
      .collection('services')
      .doc('mechanics')
      .collection('worker');

  //add data of Mechanic

  void addMechanic(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefMechanic.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Carpenter

  CollectionReference collectionRefCarpenter = FirebaseFirestore.instance
      .collection('services')
      .doc('carpenter')
      .collection('worker');

  //add data of Carpenter

  void addCarpenter(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefCarpenter.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Climbers

  CollectionReference collectionRefClimbers = FirebaseFirestore.instance
      .collection('services')
      .doc('climbers')
      .collection('worker');

  //add data of Climbers

  void addClimbers(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefClimbers.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
    });
  }

  // collection Referance of Painter

  CollectionReference collectionRefPainter = FirebaseFirestore.instance
      .collection('services')
      .doc('painters')
      .collection('worker');

  //add data of Painter

  void addPainter(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefPainter.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of DryCleaners

  CollectionReference collectionRefDryCleaners = FirebaseFirestore.instance
      .collection('services')
      .doc('drycleaners')
      .collection('worker');

  //add data of DryCleaners

  void addDryCleaners(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefDryCleaners.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Milk

  CollectionReference collectionRefMilk = FirebaseFirestore.instance
      .collection('products')
      .doc('milk')
      .collection('sellers');

  //add data of Milk

  void addMilk(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefMilk.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Coconut

  CollectionReference collectionRefCoconut = FirebaseFirestore.instance
      .collection('products')
      .doc('coconut')
      .collection('sellers');

  //add data of Coconut

  void addCoconut(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefCoconut.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Egg

  CollectionReference collectionRefEgg = FirebaseFirestore.instance
      .collection('products')
      .doc('egg')
      .collection('sellers');

  //add data of Egg

  void addEgg(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefEgg.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of mangopickle

  CollectionReference collectionRefMangoPickle = FirebaseFirestore.instance
      .collection('products')
      .doc('pickle')
      .collection('mango');

  //add data of Mango Pickle

  void addMangoPickle(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefMangoPickle.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Lime

  CollectionReference collectionRefLimePickle = FirebaseFirestore.instance
      .collection('products')
      .doc('pickle')
      .collection('lime');

  //add data of Lime

  void addLimePickle(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefLimePickle.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Gooseberry

  CollectionReference collectionRefGooseBerry = FirebaseFirestore.instance
      .collection('products')
      .doc('pickle')
      .collection('gooseberry');

  //add data of GooseBerry

  void addGooseBerry(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefGooseBerry.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Mushi

  CollectionReference collectionRefMushi = FirebaseFirestore.instance
      .collection('products')
      .doc('fish')
      .collection('mushi');

  //add data of Mushi

  void addMushi(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefMushi.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Thilopia

  CollectionReference collectionRefThilopia = FirebaseFirestore.instance
      .collection('products')
      .doc('fish')
      .collection('thilopia');

  //add data of Thilopia

  void addThilopia(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefThilopia.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Catla

  CollectionReference collectionRefCatla = FirebaseFirestore.instance
      .collection('products')
      .doc('fish')
      .collection('catla');

  //add data of CAtla

  void addCatla(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefCatla.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Rohu

  CollectionReference collectionRefRohu = FirebaseFirestore.instance
      .collection('products')
      .doc('fish')
      .collection('rohu');

  //add data of Rohu

  void addRohu(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefRohu.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Chicken

  CollectionReference collectionRefChicken = FirebaseFirestore.instance
      .collection('products')
      .doc('chicken')
      .collection('sellers');

  //add data of Chicken

  void addChicken(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefChicken.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Pepper

  CollectionReference collectionRefPepper = FirebaseFirestore.instance
      .collection('products')
      .doc('spices')
      .collection('pepper');

  //add data of Pepper

  void addPepper(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefPepper.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Ginger

  CollectionReference collectionRefGinger = FirebaseFirestore.instance
      .collection('products')
      .doc('spices')
      .collection('ginger');

  //add data of Ginger

  void addGinger(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefGinger.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Turmeric

  CollectionReference collectionRefTurmeric = FirebaseFirestore.instance
      .collection('products')
      .doc('spices')
      .collection('turmeric');

  //add data of Turmeric

  void addTurmeric(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefTurmeric.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of ChilliPowder

  CollectionReference collectionRefChilliPowder = FirebaseFirestore.instance
      .collection('products')
      .doc('spices')
      .collection('chillipowder');

  //add data of ChilliPowder

  void addChilliPowder(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefChilliPowder.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of LadiesFinger

  CollectionReference collectionRefLadiesFinger = FirebaseFirestore.instance
      .collection('products')
      .doc('vegetable')
      .collection('ladiesfinger');

  //add data of ladiesfinger

  void addLadiesFinger(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefLadiesFinger.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Tomato

  CollectionReference collectionRefTomato = FirebaseFirestore.instance
      .collection('products')
      .doc('vegetable')
      .collection('tomato');

  //add data of Tomato

  void addTomato(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefTomato.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of BitterGourd

  CollectionReference collectionRefBitterGourd = FirebaseFirestore.instance
      .collection('products')
      .doc('vegetable')
      .collection('bittergourd');

  //add data of BitterGourd

  void addBitterGourd(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefBitterGourd.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of IvyGourd

  CollectionReference collectionRefIvyGourd = FirebaseFirestore.instance
      .collection('products')
      .doc('vegetable')
      .collection('ivygourd');

  //add data of IvyGourd

  void addIvyGourd(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefIvyGourd.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Banana

  CollectionReference collectionRefBanana = FirebaseFirestore.instance
      .collection('products')
      .doc('banana')
      .collection('sellers');

  //add data of Banana

  void addBanana(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefBanana.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Cakes

  CollectionReference collectionRefCake = FirebaseFirestore.instance
      .collection('products')
      .doc('cakes')
      .collection('sellers');

  //add data of Cakes

  void addCakes(String name, String exp, String availability, String about,
      String phone, String profimg, bool isTrue) async {
    await collectionRefCake.add({
      'name': name,
      'exp': exp,
      'availability': availability,
      'profimg': profimg,
      'about': about,
      'phone': phone,
      'isTrue': isTrue,
    });
  }

  // collection Referance of Grants

  CollectionReference collectionRefGrants =
      FirebaseFirestore.instance.collection('notification');

  //add data of Grants

  void addGrants(String grant, String exp, String category) async {
    await collectionRefGrants.add({
      'grant': grant,
      'exp': exp,
      'category':category
    });
  }
}
