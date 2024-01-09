Animation Cart

class DetailsProductPage extends StatefulWidget {
  const DetailsProductPage({
    super.key,
  });

  static const String routeName = 'product-details';

  @override
  State<DetailsProductPage> createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1, -1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF8F8FF),
      body: Stack(
        children: [
          CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              ProductAppBarWidget(),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ProductDetailHeader(),
                    ProductQualityWidget(),
                    kSpacingHeight8,
                    ShopInfoWidget(),
                    kSpacingHeight8,
                    ProductVariantsWidget(),
                    kSpacingHeight8,
                    BlocBuilder<DetailsProductCubit, DetailsProductState>(
                      buildWhen: (previous, current) =>
                          previous.isShowImageProductAnimation !=
                          current.isShowImageProductAnimation,
                      builder: (context, state) {
                        return AccompanyingProductsWidget(
                          onAddProductTocart: (p0) {
                            context
                                .read<DetailsProductCubit>()
                                .emitShowImageProductAnimation(true)
                                .whenComplete(() => _controller.forward());
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              context
                                  .read<DetailsProductCubit>()
                                  .emitShowImageProductAnimation(false)
                                  .whenComplete(() => _controller.reverse());
                            });
                          },
                        );
                      },
                    ),
                    kSpacingHeight8,
                    ProductDescriptionWidget(),
                    kSpacingHeight8,
                    SimilarProductsWidget(),
                    kSpacingHeight8,
                    ProductRatingWidget(),
                    kSpacingHeight8
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            // right: MediaQuery.of(context).size.width / 2,
            // bottom: MediaQuery.of(context).size.width / 2,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: screenHeight - 100,
              child: SlideTransition(
                position: _animation,
                child: BlocBuilder<DetailsProductCubit, DetailsProductState>(
                  buildWhen: (previous, current) =>
                      previous.isShowImageProductAnimation !=
                      current.isShowImageProductAnimation,
                  builder: (context, state) {
                    if (state.isShowImageProductAnimation) {
                      return Center(
                        child: ImageWidget(
                          'https://storage.googleapis.com/vdone-dev/users/ecom/12/download-1702911123740.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ProductBottomBarWidget(),
    );
  }
}

Future<bool> emitShowImageProductAnimation(bool value) async {
    emit(state.copyWith(isShowImageProductAnimation: value));
    return value;
  }


