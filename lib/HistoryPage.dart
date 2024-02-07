import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Transaction> transactions = [
    Transaction("22 Januari 2024", "Pembelian Barang A", "-Rp 500.000",
        "Pilih Tanggal Awal"),
    Transaction("20 Januari 2024", "Transfer ke Teman B", "-Rp 200.000",
        "Pilih Tanggal Akhir"),
    // Add more transactions with categories
  ];

  List<String> categories = [
    "Semua",
    "Pilih Tanggal Awal",
    "Pilih Tanggal Akhir"
  ];

  String selectedCategory = "Semua";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Histori Transaksi",
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.05,
          ),
        ),
        backgroundColor: Color(0xFFfe1101),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items:
                      categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search transactions...',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];

                  if (selectedCategory == "Semua" ||
                      transaction.category == selectedCategory) {
                    if (searchController.text.isEmpty ||
                        transaction.description
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                      return TransactionItem(transaction: transaction);
                    }
                  }

                  return Container(); // Return an empty container if the transaction is not shown
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Transaction {
  final String date;
  final String description;
  final String amount;
  final String category;

  Transaction(this.date, this.description, this.amount, this.category);
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transaction.date),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(transaction.description),
          Text(
            transaction.amount,
            style: TextStyle(
              color: transaction.amount.startsWith('-')
                  ? Colors.red
                  : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onTap: () {
        // Add logic to navigate to detailed transaction information
      },
    );
  }
}
