import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key});

  final imageUrl =
      'https://images.unsplash.com/photo-1731946717704-5476dc2884b4?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cached Network Image'),
        actions: [
          IconButton(
              onPressed: () {
                _deleteCachedImage();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cache Limpo!')));
              },
              icon: const Icon(Icons.delete))
        ],
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          cacheManager: CacheManager(
            Config(
              'customCacheKey',
              stalePeriod: const Duration(days: 7),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            size: 100,
            color: Colors.red,
          ),
          imageBuilder: (context, imageProvider) => Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    );
  }

  void _deleteCachedImage() {
    CachedNetworkImage.evictFromCache(imageUrl);
  }
}
