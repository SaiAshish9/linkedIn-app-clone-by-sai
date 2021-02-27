import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class PostModel with ChangeNotifier {
  final _httpLink = HttpLink('https://88717c687e4f.ngrok.io' + '/graphql');
  bool _loading = true;
  List _posts = [];
  List _statusList = [];
  List _notifications = [];
  List _recommendations = [];

  fetchData(String fetchData) async {
    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: _httpLink,
    );
    final QueryOptions options = QueryOptions(document: gql(fetchData));
    final QueryResult result = await client.query(options);
    return result;
  }

  stopLoading() async {
    load() async {
      const String data = r'''
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
      final QueryResult result = await fetchData(data);
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

  fetchRecommendations() async {
    const String data = r'''
     query recommendations{
         recommendations{
           id
           image
           title
           company
           location
           easyApply
        }
      }
    ''';
    _loading = true;
    final QueryResult result = await fetchData(data);
    _loading = false;
    final List<dynamic> repositories =
        result.data['recommendations'] as List<dynamic>;
    _recommendations = repositories;
    notifyListeners();
  }

  fetchNotifications() async {
    const String data = r'''
     query notifications{
         notifications{
           id
           image
           text1
           text2
           text3
           published
        }
      }
    ''';
    _loading = true;
    final QueryResult result = await fetchData(data);
    _loading = false;
    final List<dynamic> repositories =
        result.data['notifications'] as List<dynamic>;
    _notifications = repositories;
    notifyListeners();
  }

  List get posts {
    return _posts;
  }

  List get statusList {
    return _statusList;
  }

  List get notifications {
    return _notifications;
  }

  List get recommendations {
    return _recommendations;
  }

  bool get loading {
    return _loading;
  }
}
