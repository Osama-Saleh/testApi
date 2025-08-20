import 'package:flutter/material.dart';
import 'package:ict_hub_api/Future/home_screen/data_source/product_data_source.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: FutureBuilder(
        future: ProductDataSource.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!.length == 0
                ? Center(child: Text('No Have Prodcuts'))
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(snapshot.data![index].image),
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(
                          snapshot.data![index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Text(snapshot.data![index].price.toString()),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: snapshot.data!.length);
          }
          return Center(
            child: Text('No have Data'),
          );
        },
      ),
      // body: isLoading
      //     ? Center(child: CircularProgressIndicator())
      // : ListView.separated(
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         leading:
      //             Image.network(ProductDataSource.prodctList[index].image),
      //         title: Text(ProductDataSource.prodctList[index].title),
      //         subtitle: Text(
      //           ProductDataSource.prodctList[index].description,
      //           maxLines: 2,
      //           overflow: TextOverflow.ellipsis,
      //         ),
      //         trailing: Text(
      //             ProductDataSource.prodctList[index].price.toString()),
      //       );
      //     },
      //     separatorBuilder: (context, index) => SizedBox(
      //           height: 10,
      //         ),
      //     itemCount: ProductDataSource.prodctList.length),
    );
  }
}
