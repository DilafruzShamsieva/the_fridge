import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dart_openai/dart_openai.dart';

class RecipesScreen extends StatefulWidget {
  final String ingredients;

  RecipesScreen({required this.ingredients});

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  List<String> recipes = [];

  Future<List<String>> generateRecipes(String ingredients) async {
    OpenAICompletionModel completion = await OpenAI.instance.completion.create(
        model: "text-davinci-003",
        maxTokens: 500,
        prompt:
            "Generate me simple home made recipe from $ingredients and do not add ingredient to recipe that has not provided except household staples",
        temperature: 0.4,
        n: 3);

    print(completion);
    return completion.choices.map<String>((choice) {
      return choice.text.toString();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated Recipes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ingredients:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                widget.ingredients,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              FutureBuilder<List<String>>(
                future: generateRecipes(widget.ingredients),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('No recipes available.');
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 200.0,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: double.infinity,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 1000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: snapshot.data!.map((recipe) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueAccent, width: 3)),
                                child: Center(
                                  child: Text(
                                    recipe,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
