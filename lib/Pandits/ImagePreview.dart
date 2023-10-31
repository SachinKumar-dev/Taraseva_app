import 'package:flutter/material.dart';

class ImageGridPage extends StatelessWidget {
  final List<String> imageUrls = [
    "https://images.unsplash.com/photo-1633623943543-d12dcf6b3c04?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
    "https://images.unsplash.com/photo-1461232247412-55dd149f13d6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
    "https://images.unsplash.com/photo-1500653504950-5a0179eeea8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80",
    "https://images.unsplash.com/photo-1646208505943-1a7ed7a62c1b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2052&q=80",
    "https://media.istockphoto.com/id/982849592/photo/portrait-of-two-sadhu-holy-men-kathmandu-nepal.jpg?s=612x612&w=0&k=20&c=QS4ZkLXoBo8TE1hLGLnWY5eliQ82OsllcSS-ugyWUz4=",
    "https://images.unsplash.com/photo-1606293926075-69a00dbfde81?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHVqYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
    "https://media.istockphoto.com/id/1513771132/photo/religious-offering-to-river-ganges-in-haridwar.webp?b=1&s=170667a&w=0&k=20&c=7DtFpprpoX2QVwQ9b0bPCl8koC-EIlg4EFHM_rYAVTY=",
    "https://plus.unsplash.com/premium_photo-1689838026101-6ff2055f5270?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHB1amF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1665413793441-13aedeb062d3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGFhcnRpfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
    "https://media.istockphoto.com/id/1357655083/photo/ganga-aarti-ceremony-rituals-were-performed-by-hindu-priests-at-dashashwamedh-ghat-and-assi.webp?b=1&s=170667a&w=0&k=20&c=5_9xxPNV2Njrjfbft_i-3zYCO8Yeu9tBeDw-HJElPTU=",
  ];

   ImageGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0E6B56),
        title: const Text("Pandit's Actual Photos"),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}