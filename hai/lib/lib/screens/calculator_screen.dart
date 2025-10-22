import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Controller untuk input fields kalkulator kursus
  final TextEditingController _coursePriceController = TextEditingController();
  final TextEditingController _courseCountController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _additionalFeeController = TextEditingController();

  // Controller untuk kalkulator KABATAKU
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  // Variabel untuk hasil kalkulator kursus
  double _totalPrice = 0.0;
  double _discountAmount = 0.0;
  double _additionalFee = 0.0;
  double _finalPrice = 0.0;
  double _monthlyPayment = 0.0;

  // Variabel untuk kalkulator KABATAKU
  double _kabatakuResult = 0.0;
  String _operation = '+';

  // Method untuk kalkulator kursus
  void _calculateCourseCost() {
    final double coursePrice = double.tryParse(_coursePriceController.text) ?? 0;
    final int courseCount = int.tryParse(_courseCountController.text) ?? 0;
    final double discount = double.tryParse(_discountController.text) ?? 0;
    final double additionalFee = double.tryParse(_additionalFeeController.text) ?? 0;

    setState(() {
      _totalPrice = coursePrice * courseCount;
      _discountAmount = (_totalPrice * discount) / 100;
      _additionalFee = additionalFee;
      _finalPrice = _totalPrice - _discountAmount + _additionalFee;
      _monthlyPayment = _finalPrice / 12;
    });
  }

  // Method untuk kalkulator KABATAKU
  void _calculateKabataku() {
    final double num1 = double.tryParse(_num1Controller.text) ?? 0;
    final double num2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      switch (_operation) {
        case '+':
          _kabatakuResult = num1 + num2;
          break;
        case '-':
          _kabatakuResult = num1 - num2;
          break;
        case '×':
          _kabatakuResult = num1 * num2;
          break;
        case '÷':
          _kabatakuResult = num2 != 0 ? num1 / num2 : double.infinity;
          break;
        default:
          _kabatakuResult = 0;
      }
    });
  }

  void _resetCourseCalculator() {
    setState(() {
      _coursePriceController.clear();
      _courseCountController.clear();
      _discountController.clear();
      _additionalFeeController.clear();
      _totalPrice = 0.0;
      _discountAmount = 0.0;
      _additionalFee = 0.0;
      _finalPrice = 0.0;
      _monthlyPayment = 0.0;
    });
  }

  void _resetKabataku() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _kabatakuResult = 0.0;
      _operation = '+';
    });
  }

  void _setOperation(String operation) {
    setState(() {
      _operation = operation;
    });
    _calculateKabataku();
  }

  // Method untuk contoh perhitungan kursus
  void _calculateExample(String courseType) {
    setState(() {
      switch (courseType) {
        case 'flutter':
          _coursePriceController.text = '299000';
          _courseCountController.text = '1';
          _discountController.text = '10';
          _additionalFeeController.text = '50000';
          break;
        case 'web':
          _coursePriceController.text = '399000';
          _courseCountController.text = '2';
          _discountController.text = '15';
          _additionalFeeController.text = '75000';
          break;
        case 'data':
          _coursePriceController.text = '449000';
          _courseCountController.text = '1';
          _discountController.text = '5';
          _additionalFeeController.text = '100000';
          break;
        case 'UIUX':
          _coursePriceController.text = '249000';
          _courseCountController.text = '1';
          _discountController.text = '5';
          _additionalFeeController.text = '25000';
          break;
        case 'cloud':
          _coursePriceController.text = '599000';
          _courseCountController.text = '1';
          _discountController.text = '5';
          _additionalFeeController.text = '125000';
          break;
      }
    });
    _calculateCourseCost();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          toolbarHeight: 0,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.school), text: 'Biaya Kursus'),
              Tab(icon: Icon(Icons.calculate), text: 'KABATAKU'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // TAB 1: KALKULATOR BIAYA KURSUS
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Kalkulator Biaya Kursus',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Hitung total biaya kursus yang ingin Anda ambil',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Contoh Perhitungan Cepat
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contoh Perhitungan Cepat:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _calculateExample('flutter'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[700],
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Flutter Course'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _calculateExample('web'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[700],
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Web Dev'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _calculateExample('data'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange[700],
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Data Science'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _calculateExample('UIUX'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple[700],
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('UI/UX Design'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _calculateExample('cloud'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal[700],
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Cloud Computing'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Input Fields
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _coursePriceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Harga per Kursus (Rp)',
                              prefixIcon: Icon(Icons.attach_money),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _courseCountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Jumlah Kursus',
                              prefixIcon: Icon(Icons.school),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _discountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Diskon (%)',
                              prefixIcon: Icon(Icons.discount),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _additionalFeeController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Biaya Tambahan (Rp)',
                              prefixIcon: Icon(Icons.add),
                              border: OutlineInputBorder(),
                              hintText: 'Contoh: biaya materi, sertifikat',
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _calculateCourseCost,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue[700],
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                  ),
                                  child: const Text('HITUNG TOTAL'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: _resetCourseCalculator,
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                  ),
                                  child: const Text('RESET'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Results
                  if (_totalPrice > 0) ...[
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Rincian Biaya Kursus',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildCostItem('Total Harga Kursus', 'Rp ${_totalPrice.toStringAsFixed(0)}'),
                            _buildCostItem('Diskon', '- Rp ${_discountAmount.toStringAsFixed(0)}'),
                            _buildCostItem('Biaya Tambahan', '+ Rp ${_additionalFee.toStringAsFixed(0)}'),
                            const Divider(),
                            _buildCostItem(
                              'Total Yang Harus Dibayar',
                              'Rp ${_finalPrice.toStringAsFixed(0)}',
                              isHighlighted: true,
                            ),
                            _buildCostItem(
                              'Cicilan 12 Bulan',
                              'Rp ${_monthlyPayment.toStringAsFixed(0)}/bulan',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  // Information
                  const SizedBox(height: 20),
                  Card(
                    elevation: 2,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rumus Perhitungan:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Total = (Harga × Jumlah) - Diskon + Biaya Tambahan'),
                          SizedBox(height: 4),
                          Text('Diskon = Total Harga × (Persentase Diskon ÷ 100)'),
                          SizedBox(height: 4),
                          Text('Cicilan = Total Final ÷ 12 bulan'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // TAB 2: KALKULATOR KABATAKU
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Kalkulator KABATAKU',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Kali, Bagi, Tambah, Kurang untuk perhitungan kursus',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Input Fields
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _num1Controller,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Angka Pertama',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) => _calculateKabataku(),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    _operation,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[700],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TextFormField(
                                  controller: _num2Controller,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: 'Angka Kedua',
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) => _calculateKabataku(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Operation Buttons
                          Row(
                            children: [
                              _buildOperationButton('+', Colors.green, 'Penjumlahan'),
                              const SizedBox(width: 8),
                              _buildOperationButton('-', Colors.red, 'Pengurangan'),
                              const SizedBox(width: 8),
                              _buildOperationButton('×', Colors.orange, 'Perkalian'),
                              const SizedBox(width: 8),
                              _buildOperationButton('÷', Colors.purple, 'Pembagian'),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // Result
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Hasil Perhitungan',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  _operation == '÷' && double.tryParse(_num2Controller.text) == 0
                                      ? 'Error: Tidak bisa dibagi nol!'
                                      : _kabatakuResult.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: _operation == '÷' && double.tryParse(_num2Controller.text) == 0
                                        ? Colors.red
                                        : Colors.blue[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Reset Button
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: _resetKabataku,
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: const Text('RESET KALKULATOR'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Contoh Penggunaan untuk Kursus
                  const SizedBox(height: 20),
                  Card(
                    elevation: 2,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contoh Penggunaan untuk Kursus:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text('➕ Menghitung total biaya beberapa kursus'),
                          SizedBox(height: 4),
                          Text('➖ Menghitung sisa budget setelah membeli kursus'),
                          SizedBox(height: 4),
                          Text('✖️ Menghitung biaya kursus untuk beberapa siswa'),
                          SizedBox(height: 4),
                          Text('➗ Membagi biaya kursus dengan teman sekelas'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperationButton(String operation, Color color, String tooltip) {
    return Expanded(
      child: Tooltip(
        message: tooltip,
        child: ElevatedButton(
          onPressed: () => _setOperation(operation),
          style: ElevatedButton.styleFrom(
            backgroundColor: _operation == operation ? color : color.withOpacity(0.3),
            foregroundColor: _operation == operation ? Colors.white : color,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: Text(
            operation,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildCostItem(String label, String value, {bool isHighlighted = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isHighlighted ? Colors.blue[700] : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _coursePriceController.dispose();
    _courseCountController.dispose();
    _discountController.dispose();
    _additionalFeeController.dispose();
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }
}