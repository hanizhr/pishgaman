import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_3/features/barbari/core/widgets/custom_nav_bar.dart';
import 'package:flutter_application_3/features/barbari/presentation/bloc/barbari_bloc.dart';
import 'package:flutter_application_3/features/barbari/presentation/bloc/barbari_event.dart';
import 'package:flutter_application_3/features/barbari/presentation/bloc/barbari_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.read<BarbariBloc>()..add(LoadBarbariList()),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F7FA),
        
          body: BlocBuilder<BarbariBloc, BarbariState>(
            builder: (context, state) {
              if (state is BarbariLoading) {
                return const Center(child: CircularProgressIndicator());
              }
        
              if (state is BarbariLoaded) {
                return CustomScrollView(
                  slivers: [
              
                    SliverToBoxAdapter(
                      child: Stack(
                        children: [
                          Container(
                            height: 300,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF6BC8F7),
                                  Color(0xFFE3F5FF),
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                          ),
        
                          Positioned(
                            top: 50,
                            left: 16,
                            child: IconButton(
                              icon: Image.asset('assets/images/menu.png',
                                  width: 32, height: 32),
                              onPressed: () {},
                            ),
                          ),
        
                          Positioned(
                            top: 110,
                            left: 0,
                            right: 0,
                            child: Column(
                              children: [
                                Image.asset('assets/images/logo.png', height: 100),
                                const SizedBox(height: 16),
                                const Text(
                                  "پیشگامان",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 66, 69, 245),
                                  ),
                                ),
                                const Text(
                                  "اپلیکیشن باربری",
                                  style: TextStyle(
                                      fontSize: 15, color: Color.fromARGB(179, 255, 109, 24)),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  "اکانت شما احراز هویت شده است",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.greenAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
        
                    SliverToBoxAdapter(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: Colors.cyan.shade400, width: 2.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 15,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
     
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                                child: Container(
                                  height: 52,
                                  
                                  child: const Row(
                                    children: [
                                      SizedBox(width: 14),
                                      Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0), size: 26),
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          "جستجوی بار",
                                          style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                       
                              ...state.barvaris.map((c) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 18),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200, width: 0.8),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                        Expanded(
                                        child: Text(
                                          c.title,
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                
                                      Text(
                                        "${c.weight} تن",
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      ),
                                        const SizedBox(width: 8),
                                       if (c.badge?.isNotEmpty ?? false)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          child: Text(
                                            c.badge!,
                                            style: TextStyle(
                                              color: Colors.red.shade700,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
         
                                      const SizedBox(width: 12),

                                      const Icon(Icons.chevron_right, color: Colors.grey),
                                      const SizedBox(width: 12),
        
                                    
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
        
                    const SliverToBoxAdapter(child: SizedBox(height: 24)),
        
                    SliverToBoxAdapter(
                      child: _buildCard(
                        title: "پیشنهادهای من",
                        subtitle: "۲ پیشنهاد تعیین نشده",
                      ),
                    ),
        
                    const SliverToBoxAdapter(child: SizedBox(height: 16)),
        
                    SliverToBoxAdapter(
                      child: _buildCard(
                        title: "خدمات نزدیک من",
                        subtitle: "خدماتی نظیر تعمیرگاه، رستوران و غیره",
                      ),
                    ),
        
                    const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                );
              }
        
              if (state is BarbariError) {
                return Center(child: Text(state.message));
              }
        
              return const SizedBox();
            },
          ),
        
          bottomNavigationBar: CustomNavBar(
            onHomeTap: () => print("Home tapped"),
            onProfileTap: () => print("Profile tapped"),
            onNotifyTap: () => print("Notify tapped"),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required String subtitle}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.cyan.shade400, width: 2.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(subtitle,
                    style: TextStyle(
                        fontSize: 14, color: Colors.grey.shade600)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios,
              size: 20, color: Colors.cyan.shade600),
        ],
      ),
    );
  }
}
