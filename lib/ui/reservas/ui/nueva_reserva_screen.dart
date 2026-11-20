import 'package:flutter/material.dart';

import '../../../domain/models/espacio.dart';
import '../../core/ui/button.dart';

class NuevaReservaScreen extends StatefulWidget {
  const NuevaReservaScreen({super.key, required this.espacio});

  final Espacio espacio;

  @override
  State<NuevaReservaScreen> createState() => _NuevaReservaScreenState();
}

class _NuevaReservaScreenState extends State<NuevaReservaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _asistentesController = TextEditingController(text: '1');
  final _actividadController = TextEditingController();
  DateTime _fecha = DateTime.now().add(const Duration(days: 1));
  int _horaInicio = 10;
  int _duracion = 1;
  final Set<String> _serviciosSeleccionados = {};

  int get _precioTotal {
    final servicios = widget.espacio.serviciosDisponibles
        .where((servicio) => _serviciosSeleccionados.contains(servicio.id))
        .fold<int>(0, (total, servicio) => total + servicio.precioCentimos);
    return widget.espacio.precioHoraCentimos * _duracion + servicios;
  }

  @override
  void dispose() {
    _asistentesController.dispose();
    _actividadController.dispose();
    super.dispose();
  }

  Future<void> _seleccionarFecha() async {
    final fecha = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: _fecha,
    );
    if (fecha != null) {
      setState(() => _fecha = fecha);
    }
  }

  Future<void> _seleccionarHora() async {
    final hora = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: _horaInicio, minute: 0),
    );
    if (hora != null) {
      setState(() => _horaInicio = hora.hour);
    }
  }

  Future<void> _seleccionarDuracion() async {
    final duracion = await showDialog<int>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Selecciona la duración'),
        children: [1, 2, 3]
            .map(
              (valor) => SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(valor),
                child: Text('$valor hora${valor == 1 ? '' : 's'}'),
              ),
            )
            .toList(),
      ),
    );
    if (duracion != null) {
      setState(() => _duracion = duracion);
    }
  }

  void _confirmar() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Solicitud confirmada'),
        content: Text(
          'Tu solicitud para ${widget.espacio.nombre} se ha confirmado '
          'de forma simulada.\n\n'
          'Total: ${(_precioTotal / 100).toStringAsFixed(2)} EUR\n\n'
          'No se ha guardado una reserva real.',
        ),
        actions: [
          Boton(
            texto: 'Volver al detalle',
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      appBar: AppBar(
        title: const Text('Nueva reserva'),
        backgroundColor: const Color.fromRGBO(246, 243, 236, 1),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              widget.espacio.nombre,
              style: const TextStyle(
                color: Color.fromRGBO(35, 51, 62, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.espacio.ubicacion,
              style: const TextStyle(color: Color.fromRGBO(105, 111, 113, 1)),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _actividadController,
              decoration: const InputDecoration(
                labelText: 'Actividad',
                prefixIcon: Icon(Icons.event_note_outlined),
              ),
              validator: (valor) => valor == null || valor.trim().isEmpty
                  ? 'Indica la actividad'
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _asistentesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número de asistentes (máximo ${widget.espacio.aforo})',
                prefixIcon: const Icon(Icons.people_outline),
              ),
              validator: (valor) {
                final asistentes = int.tryParse(valor ?? '');
                if (asistentes == null || asistentes < 1) {
                  return 'Indica un número válido';
                }
                if (asistentes > widget.espacio.aforo) {
                  return 'Supera el aforo del espacio';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _Selector(
              titulo: 'Fecha',
              valor: '${_fecha.day}/${_fecha.month}/${_fecha.year}',
              onPressed: _seleccionarFecha,
            ),
            _Selector(
              titulo: 'Hora de inicio',
              valor: '$_horaInicio:00',
              onPressed: _seleccionarHora,
            ),
            _Selector(
              titulo: 'Duración',
              valor: '$_duracion hora${_duracion == 1 ? '' : 's'}',
              onPressed: _seleccionarDuracion,
            ),
            const SizedBox(height: 12),
            const Text(
              'Servicios adicionales',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ...widget.espacio.serviciosDisponibles.map(
              (servicio) => CheckboxListTile(
                value: _serviciosSeleccionados.contains(servicio.id),
                title: Text(servicio.nombre),
                subtitle: Text(
                  '${(servicio.precioCentimos / 100).toStringAsFixed(2)} EUR',
                ),
                onChanged: (seleccionado) {
                  setState(() {
                    if (seleccionado == true) {
                      _serviciosSeleccionados.add(servicio.id);
                    } else {
                      _serviciosSeleccionados.remove(servicio.id);
                    }
                  });
                },
              ),
            ),
            const SizedBox(height: 12),
            Card(
              color: const Color.fromRGBO(232, 235, 231, 1),
              child: ListTile(
                title: const Text('Total estimado'),
                trailing: Text(
                  '${(_precioTotal / 100).toStringAsFixed(2)} EUR',
                  style: const TextStyle(
                    color: Color.fromRGBO(35, 51, 62, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Boton(
              texto: 'Confirmar solicitud simulada',
              icono: Icons.check_circle_outline,
              ancho: double.infinity,
              onPressed: _confirmar,
            ),
          ],
        ),
      ),
    );
  }
}

class _Selector extends StatelessWidget {
  const _Selector({
    required this.titulo,
    required this.valor,
    required this.onPressed,
  });

  final String titulo;
  final String valor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(titulo),
      subtitle: Text(valor),
      trailing: const Icon(Icons.edit_calendar_outlined),
      onTap: onPressed,
    );
  }
}
