import 'package:flutter/material.dart';
import 'package:yo_event/Accounts/login.dart';
 
 


class onBoardingPage extends StatefulWidget{
  const onBoardingPage({Key? key}) :super(key: key);

  @override
  State<onBoardingPage> createState() => _onBoardingPageState();
}

class _onBoardingPageState extends State<onBoardingPage> {

  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    // TODO: Implement the navigation to the login page
    // For example:
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index){
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index)=>  onBoardingcontent( 
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                ),
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   ElevatedButton(
                        onPressed: () {
                          // Handle going back to the previous page or skip logic
                          if (_pageIndex > 0) {
                            _pageController.previousPage(
                              curve: Curves.ease,
                              duration: const Duration(milliseconds: 300),
                            );
                          } else {
                            _goToLogin();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon( 
                          Icons.arrow_back,
                        color: Colors.white
                        ),
                      ),
                  const Spacer(),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   ...List.generate( demo_data.length,
                   (index) => Padding(
                     padding:  const EdgeInsets.only(right: 4),
                     child: dotIndicator(isActive: index ==_pageIndex),
                   )),
                  ],
                  ),
                //  const Spacer(),
                   if (_pageIndex < demo_data.length - 1)
                   Expanded(child:  
                    ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                      style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                    ),
                 const Spacer(),
                  if (_pageIndex == demo_data.length - 1)
                    Expanded(child:  
                    ElevatedButton(
                      onPressed: _goToLogin,
                      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                      child: Text('Finish'),
                    ),
                    ),
                ],
              ),
            ],
          ),
        ),
    ),
    );
  }
}

class dotIndicator extends StatelessWidget {
  const dotIndicator({
    Key? key,
     
     this.isActive = false,
  }):super(key: key); 
  final bool isActive;
  
  get primaryColor => Color(0xff0a0e21);
   
  
   

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? 12:4, 
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? primaryColor:primaryColor.withOpacity(0.4),
         
        borderRadius: BorderRadius.all(Radius.circular( 12))),

    );
  }
}

class onboard{
  final String image, title, description;

  onboard({
    required this.image, 
    required this.title, 
    required this.description});
}

final List<onboard> demo_data=[
  onboard( 
    image: "assets/splash.jpg",
    title: "Discover, Plan, and Experience \nExtraordinary Events, All in One Place." ,
    description: " Experience captivating events daily,catering to your passions \n from concerts to conferences, sports to food festivals, we have it all!",),
             
  onboard(
    image:"assets/splash.jpg", 
    title: "Discover EVENTPro+ ,\n a world of endless excitement and incredible memories!", 
    description: "Join the community today and make every moment count!",),

  onboard(
    image:"assets/splash.jpg", 
    title: " Discover EVENTPro+ ,\n a world of endless excitement and incredible memories!", 
    description: "Join the community today and make every moment count!",),

  onboard(
    image:"assets/splash.jpg", 
    title: " Discover EVENTPro+ ,\n a world of endless excitement and incredible memories!", 
    description: "Join the community today and make every moment count!",)
];

class onBoardingcontent extends StatelessWidget {
  const onBoardingcontent({
    super.key, 
    required this.image, 
    required this.title, 
    required this.description,  
  });
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
         Image.asset(
          image,
          height: 250,
          
          ),
          const Spacer(),
        Text(
           title,
          textAlign: TextAlign.center,
          style: Theme.of(context).
          textTheme.
          headlineMedium?.
          copyWith(fontWeight: FontWeight.w100),
        ),
        const SizedBox(height: 20),
        Text(
           description,
          textAlign: TextAlign.center,
           
        ),
        const Spacer(),
      ],
    );
  }
}