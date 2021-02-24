import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class PostModel with ChangeNotifier {
  final _httpLink = HttpLink('https://b00d53df849b.ngrok.io' + '/graphql');
  bool _loading = true;
  List _posts = [];
  List _statusList = [];

  stopLoading() async {
    load() async {
      final GraphQLClient client = GraphQLClient(
        cache: GraphQLCache(),
        link: _httpLink,
      );
      const String fetchData = r'''
      query posts {
            posts{
            id
            content
            image
            userReaction
            userReactionText
            published
           videoUrl
           author{
             id
             name
             headline
             image
           }
           commentCount
           reactions
           liked
           clapped
           loved
           bright
           support
           curious
           variableReactionsCount
    }
}
    ''';
      final QueryOptions options = QueryOptions(document: gql(fetchData));
      final QueryResult result = await client.query(options);
      if (result.hasException) {
        print(result.exception.toString());
      } else {
        print("posts fetched");
      }
      final List<dynamic> repositories = result.data['posts'] as List<dynamic>;
      _posts = repositories;
      final List<dynamic> repositories1 = List.from(repositories);
      repositories1.shuffle();
      _statusList = repositories1;
      _loading = false;
      notifyListeners();
    }

    load();
    // return Timer(Duration(seconds: 5), load);
  }

  List get posts {
    return _posts;
  }

  List get statusList {
    return _statusList;
  }

  bool get loading {
    return _loading;
  }
}
