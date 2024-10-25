import 'package:boiler_plate/data/remote/newsList/models/news_list_model.dart';
import 'package:boiler_plate/helpers/base_screen_view.dart';
import 'package:boiler_plate/routes/app_routes.dart';
import 'package:boiler_plate/utils/app_sizes.dart';
import 'package:boiler_plate/utils/translations.dart';
import 'package:boiler_plate/view/screens/news/news_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class NewsListView extends ConsumerStatefulWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  ConsumerState<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends ConsumerState<NewsListView>
    with BaseScreenView {
  late NewsListViewModel _viewModel;
  @override
  void initState() {
    _viewModel = ref.read(newsListViewModel);
    _viewModel.attachView(this);
    _viewModel.initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = ref.watch(newsListViewModel);
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.page2),
        // leading: BackButton(),
      ),
      body: _viewModel.newsListResponse == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Wrap(
                children: [
                  ..._viewModel.newsListResponse?.articles
                          ?.map((e) => card(e))
                          .toList() ??
                      [],
                ],
              ),
            ),
    );
  }

  Widget card(Article article) {
    final width = MediaQuery.of(context).size.width > 480
        ? MediaQuery.of(context).size.width / 2
        : MediaQuery.of(context).size.width;
    return article.urlToImage == null
        ? Container()
        : SizedBox(
            width: width,
            child: AspectRatio(
              aspectRatio: 1,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSizes.p12),
                    bottomRight: Radius.circular(AppSizes.p12),
                  ),
                ),
                elevation: AppSizes.p10,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        article.urlToImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ListTile(
                      title: Text(article.title ?? ""),
                      subtitle: Text(
                        article.description ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppSizes.p16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Text(
                            article.author ?? "",
                            overflow: TextOverflow.ellipsis,
                          )),
                          Text(
                            DateFormat.yMMMd().format(article.publishedAt!),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  @override
  void navigateToScreen(AppRoute appRoute, {Map<String, String>? params}) {
    context.pushNamed(
      appRoute.name, pathParameters: params ?? {},
      // {"fid": NavBarScreens.data[1].id},
    );
  }

  @override
  void showSnackbar(String message, {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
