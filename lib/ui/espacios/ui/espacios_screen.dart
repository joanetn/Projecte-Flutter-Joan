import 'package:flutter/material.dart';

import '../../../data/repositories/espacios_repository.dart';
import '../../../data/services/espacios_local_service.dart';
import '../../../domain/models/espacio.dart';
import 'espacio_detalle_screen.dart';

class EspaciosScreen extends StatelessWidget {
  EspaciosScreen({super.key})
      : _espacios = EspaciosRepository(
          service: EspaciosLocalService(),
        ).obtenerTodos();

  final List<Espacio> _espacios;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      appBar: AppBar(
        title: const Text('Principal'),
        backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Espacios disponibles',
            style: TextStyle(
              color: Color.fromRGBO(35, 51, 62, 1),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Encuentra un lugar para tu próxima actividad.',
            style: TextStyle(color: Color.fromRGBO(105, 111, 113, 1)),
          ),
          const SizedBox(height: 20),
          ..._espacios.map((espacio) => _EspacioCard(espacio: espacio)),
        ],
      ),
    );
  }
}

class _EspacioCard extends StatelessWidget {
  const _EspacioCard({required this.espacio});

  final Espacio espacio;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: const Color.fromRGBO(255, 255, 255, 1),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(54, 76, 92, 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.location_city_outlined,
                color: Colors.white,
                size: 48,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              espacio.nombre,
              style: const TextStyle(
                color: Color.fromRGBO(35, 51, 62, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              espacio.descripcion,
              style: const TextStyle(
                color: Color.fromRGBO(105, 111, 113, 1),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Color.fromRGBO(190, 150, 82, 1),
                  size: 18,
                ),
                const SizedBox(width: 4),
                Expanded(child: Text(espacio.ubicacion)),
                const Icon(
                  Icons.people_outline,
                  color: Color.fromRGBO(190, 150, 82, 1),
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text('${espacio.aforo} personas'),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => EspacioDetalleScreen(espacio: espacio),
                    ),
                  );
                },
                child: const Text('Ver detalle'),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${(espacio.precioHoraCentimos / 100).toStringAsFixed(2)} '
              '${espacio.moneda} / hora',
              style: const TextStyle(
                color: Color.fromRGBO(54, 76, 92, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
