import 'package:flutter/material.dart';
import 'package:house_price_prediction/loader.dart';
import 'package:house_price_prediction/networking.dart';
import 'package:house_price_prediction/price_model.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  TextEditingController _areaController = TextEditingController();
String _bath,_bhk;
  bool _bhkSel1=false,_bhkSel2=false,_bhkSel3=false,_bhkSel4=false,_bathSel1=false,_bathSel2=false,_bathSel3=false,_bathSel4=false;
  TextEditingController _ageController = TextEditingController();
  final List<String> _items = ['Male', 'female'].toList();
  PriceFetchService priceFetchService = PriceFetchService();
  PriceModel _priceModel;
  bool _isloading=false,_onTap=false;
  final List<String> _locationitems = [
    '1st block jayanagar',
    "1st phase jp nagar",
    "2nd phase judicial layout",
    "2nd stage nagarbhavi",
    "5th block hbr layout",
    "5th phase jp nagar",
    "6th phase jp nagar",
    "7th phase jp nagar",
    "8th phase jp nagar",
    "9th phase jp nagar",
    "abbigere",
    "aecs layout",
    "akshaya nagar",
    "ambalipura",
    "ambedkar nagar",
    "amruthahalli",
    "anandapura",
    "ananth nagar",
    "anekal",
    "anjanapura",
    "ardendale",
    "arekere",
    "attibele",
    "babusapalaya",
    "badavala nagar",
    "balagere",
    "banashankari",
    "banashankari stage ii",
    "banashankari stage iii",
    "banashankari stage v",
    "banashankari stage vi",
    "banaswadi",
    "banjara layout",
    "bannerghatta",
    "bannerghatta road",
    "basavangudi",
    "basaveshwara nagar",
    "battarahalli",
    "begur",
    "begur road",
    "bellandur",
    "beml layout",
    "benson town",
    "bharathi nagar",
    "bhoganhalli",
    "billekahalli",
    "binny pete",
    "bisuvanahalli",
    "bommanahalli",
    "bommasandra",
    "bommasandra industrial area",
    "bommenahalli",
    "brookefield",
    "btm 2nd stage",
    "btm layout",
    "budigere",
    "chamrajpet",
    "chandapura",
    "channasandra",
    "chikka tirupathi",
    "chikkabanavar",
    "chikkalasandra",
    "choodasandra",
    "cooke town",
    "cox town",
    "cunningham road",
    "cv raman nagar",
    "dasanapura",
    "dasarahalli",
    "devanahalli",
    "devarachikkanahalli",
    "dodda nekkundi",
    "doddaballapur",
    "doddakallasandra",
    "doddathoguru",
    "domlur",
    "dommasandra",
    "electronic city",
    "electronic city phase ii",
    "electronics city phase 1",
    "epip zone",
    "frazer town",
    "garudachar palya",
    "giri nagar",
    "gm palaya",
    "gollarapalya hosahalli",
    "gottigere",
    "green glen layout",
    "gubbalala",
    "gunjur",
    "hal 2nd stage",
    "haralur road",
    "harlur",
    "hbr layout",
    "hebbal",
    "hebbal kempapura",
    "hegde nagar",
    "hennur",
    "hennur road",
    "hoodi",
    "horamavu agara",
    "horamavu banaswadi",
    "hormavu",
    "hosa road",
    "hosakerehalli",
    "hoskote",
    "hosur road",
    "hrbr layout",
    "hsr layout",
    "hulimavu",
    "iblur village",
    "indira nagar",
    "isro layout",
    "itpl",
    "jakkur",
    "jalahalli",
    "jalahalli east",
    "jigani",
    "jp nagar",
    "judicial layout",
    "kadubeesanahalli",
    "kadugodi",
    "kaggadasapura",
    "kaggalipura",
    "kaikondrahalli",
    "kalena agrahara",
    "kalyan nagar",
    "kambipura",
    "kammanahalli",
    "kammasandra",
    "kanakapura",
    "kanakpura road",
    "kannamangala",
    "karuna nagar",
    "kasavanhalli",
    "kasturi nagar",
    "kathriguppe",
    "kaval byrasandra",
    "kenchenahalli",
    "kengeri",
    "kengeri satellite town",
    "kereguddadahalli",
    "kodichikkanahalli",
    "kodigehaali",
    "kodigehalli",
    "kodihalli",
    "kogilu",
    "konanakunte",
    "koramangala",
    "kothannur",
    "kothanur",
    "kr puram",
    "kudlu",
    "kudlu gate",
    "kumaraswami layout",
    "kundalahalli",
    "laggere",
    "lakshminarayana pura",
    "lb shastri nagar",
    "lingadheeranahalli",
    "magadi road",
    "mahadevpura",
    "mahalakshmi layout",
    "mallasandra",
    "malleshpalya",
    "malleshwaram",
    "marathahalli",
    "margondanahalli",
    "marsur",
    "mico layout",
    "munnekollal",
    "murugeshpalya",
    "mysore road",
    "nagarbhavi",
    "nagasandra",
    "nagavara",
    "nagavarapalya",
    "narayanapura",
    "neeladri nagar",
    "nehru nagar",
    "ngr layout",
    "nri layout",
    "old airport road",
    "old madras road",
    "ombr layout",
    "padmanabhanagar",
    "pai layout",
    "panathur",
    "parappana agrahara",
    "pattandur agrahara",
    "poorna pragna layout",
    "prithvi layout",
    "r.t. nagar",
    "rachenahalli",
    "raja rajeshwari nagar",
    "rajaji nagar",
    "rajiv nagar",
    "ramagondanahalli",
    "ramamurthy nagar",
    "rayasandra",
    "sahakara nagar",
    "sanjay nagar",
    "sarakki nagar",
    "sarjapur",
    "sarjapur  road",
    "sarjapura - attibele road",
    "sector 2 hsr layout",
    "sector 7 hsr layout",
    "seegehalli",
    "shampura",
    "shivaji nagar",
    "singasandra",
    "somasundara palya",
    "sompura",
    "sonnenahalli",
    "subramanyapura",
    "sultan palaya",
    "talaghattapura",
    "tc palaya",
    "thanisandra",
    "thigalarapalya",
    "thubarahalli",
    "thyagaraja nagar",
    "tindlu",
    "tumkur road",
    "ulsoor",
    "uttarahalli",
    "varthur",
    "varthur road",
    "vasanthapura",
    "vidyaranyapura",
    "vijayanagar",
    "vishveshwarya layout",
    "vishwapriya layout",
    "vittasandra",
    "whitefield",
    "yelachenahalli",
    "yelahanka",
    "yelahanka new town",
    "yelenahalli",
    "yeshwanthpur"
  ].toList();

  String _selection;
  String _location;

  @override
  void initState() {
    _selection = _items.first;
    _location = _locationitems.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dropdownMenuOptions = _items
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    final dropdownLocationMenuOptions = _locationitems
        .map((String item) =>
    new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 100,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff4e89ae),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Icon(Icons.home)
            ),
          ),
        ),

        title: Text(
          "Bengaluru House Price Prediction",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Container(
          //
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           fit: BoxFit.cover,
          //           colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
          //           image: NetworkImage("https://www.bbtacoma.com/wp-content/uploads/2018/02/House-on-Hand-Icon-with-color-250X220.jpg"))),
          // ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          child: Card(
                            elevation: 10,
                            color: Colors.white54,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),

                              ),
                              child: TextField(
                                controller: _areaController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Enter area",
                                  labelStyle: TextStyle(color: Colors.black),
                                  hintText: 'Area in sq metres',
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Wrap(
                      children: <Widget>[
                        bhk1(2),
                        bhk2(3),
                        bhk3(4),
                        bhk4(5),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Wrap(
                      children: <Widget>[
                        bath1(2),
                        bath2(3),
                        bath3(4),
                        bath4(5),
                      ],
                    ),
                  ),
                  locationDropdown(dropdownLocationMenuOptions),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: 60,
                            child: RaisedButton(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blueAccent)),
                              color: Color(0xff0278ae),
                              splashColor: Colors.lightBlue,
                              onPressed: () async{

                                if (_areaController.text.isNotEmpty&&_bath.isNotEmpty&&_bhk.isNotEmpty&&_location.isNotEmpty)
                                 {
                                   setState(() {
                                     _isloading=true;
                                     _onTap=true;
                                   });
                                   var map = new Map<String, dynamic>();
                                   map['total_sqft'] = _areaController.text;
                                   map['location'] = _location;
                                   map['bhk'] = _bhk;
                                   map['bath'] = _bath;
                                   print(map);
                                   final PriceModel priceModel =
                                   await priceFetchService.fetchPrice(map);
                                   setState(() {
                                     _priceModel= priceModel;
                                     _isloading=false;
                                   });

                                   _priceModel != null ?  print("predicted"): "";
                                 }
                              },
                              child: Text(
                                "predict",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _priceModel!=null &&_isloading==false?  Card(

                    elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Estimated price:${_priceModel.estimatedPrice} Lakhs", style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      )):_onTap?SpinKitCircle(color: Colors.black,):Text("Hope you find the best price!", style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),)

                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Row locationDropdown(
      List<DropdownMenuItem<String>> dropdownLocationMenuOptions) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 24),
            child: Card(
              elevation: 10,
              color: Colors.white54,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),

                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: DropdownButton<String>(
                        hint: Text('Location'),
                        dropdownColor: Color(0xff4e89ae),
                        isExpanded: true,
                        value: _location,
                        items: dropdownLocationMenuOptions,
                        onChanged: (s) {
                          setState(() {
                            _location = s;
                          });
                        }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding bhk1(int txt) {

    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SizedBox(
        width: 87,
        height: 50,
        child: RaisedButton(
          onPressed: () {

            setState(() {
              _bhk=txt.toString();
              _bhkSel1=true;
              _bhkSel2=false;
              _bhkSel3=false;
              _bhkSel4=false;

            });

          },
          elevation: 10,
          color: _bhkSel1?Color(0xff1aa6b7):Color(0xff07689f),
          splashColor: Color(0xff4e89ae),
          child: Text(
            "${txt} bhk",
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: Colors.white,

        ),
      ),
    );
  }
  Padding bhk2(int txt) {

    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SizedBox(
        width: 87,
        height: 50,
        child: RaisedButton(
          onPressed: () {

            setState(() {
              _bhk=txt.toString();
              _bhkSel2=true;
              _bhkSel1=false;
              _bhkSel3=false;
              _bhkSel4=false;
            });

          },
          elevation: 10,
          color: _bhkSel2?Color(0xff1aa6b7):Color(0xff07689f),
          splashColor: Color(0xff4e89ae),
          child: Text(
            "${txt} bhk",
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: Colors.white,

        ),
      ),
    );
  }
  Padding bhk3(int txt) {

    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SizedBox(
        width: 87,
        height: 50,
        child: RaisedButton(
          onPressed: () {

            setState(() {
              _bhk=txt.toString();
              _bhkSel3=true;
              _bhkSel2=false;
              _bhkSel4=false;
              _bhkSel1=false;
            });

          },
          elevation: 10,
          color: _bhkSel3?Color(0xff1aa6b7):Color(0xff07689f),
          splashColor: Color(0xff4e89ae),
          child: Text(
            "${txt} bhk",
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: Colors.white,

        ),
      ),
    );
  }
  Padding bhk4(int txt) {

    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SizedBox(
        width: 87,
        height: 50,
        child: RaisedButton(
          onPressed: () {

            setState(() {
              _bhk=txt.toString();
              _bhkSel4=true;
              _bhkSel2=false;
              _bhkSel1=false;
              _bhkSel3=false;
            });

          },
          elevation: 10,
          color: _bhkSel4?Color(0xff1aa6b7):Color(0xff07689f),
          splashColor: Color(0xff4e89ae),
          child: Text(
            "${txt} bhk",
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: Colors.white,

        ),
      ),
    );
  }
  Padding bath1(int txt) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SizedBox(
        width: 87,
        height: 50,
        child: RaisedButton(
          elevation: 10,
          color: _bathSel1?Color(0xff1aa6b7):Color(0xff07689f),
          splashColor: Colors.amberAccent,
          child: Text(
            "${txt} baths",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              _bath=txt.toString();
              _bathSel1=true;
              _bathSel2=false;
              _bathSel3=false;
              _bathSel4= false;
            });
          },
        ),
      ),
    );
  }
  Padding bath2(int txt) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SizedBox(
        width: 87,
        height: 50,
        child: RaisedButton(
          elevation: 10,
          color: _bathSel2?Color(0xff1aa6b7):Color(0xff07689f),
          splashColor: Colors.amberAccent,
          child: Text(
            "${txt} baths",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              _bath=txt.toString();
              _bathSel2=true;
              _bathSel1=false;
              _bathSel3=false;
              _bathSel4= false;
            });
          },
        ),
      ),
    );
  }
  Padding bath3(int txt) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SizedBox(
        width: 87,
        height: 50,
        child: RaisedButton(
          elevation: 10,
          color: _bathSel3?Color(0xff1aa6b7):Color(0xff07689f),
          splashColor: Colors.amberAccent,
          child: Text(
            "${txt} baths",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              _bath=txt.toString();
              _bathSel2=false;
              _bathSel1=false;
              _bathSel3=true;
              _bathSel4= false;
            });
          },
        ),
      ),
    );
  }
  Padding bath4(int txt) {
    return Padding(
      padding: const EdgeInsets.only(left: 6.0),
      child: SizedBox(
        width: 87,
        height: 50,
        child: RaisedButton(
          elevation: 10,
          color: _bathSel4?Color(0xff1aa6b7):Color(0xff07689f),
          splashColor: Colors.amberAccent,
          child: Text(
            "${txt} baths",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              _bath=txt.toString();
              _bathSel2=false;
              _bathSel1=false;
              _bathSel3=false;
              _bathSel4= true;
            });
          },
        ),
      ),
    );
  }
}
