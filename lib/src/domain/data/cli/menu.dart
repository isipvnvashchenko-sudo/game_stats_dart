import '../repositories/category_repository.dart';
import '../repositories/product_repository.dart';
import '../repositories/customer_repository.dart';
import '../repositories/order_repository.dart';
import '../repositories/order_item_repository.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/customer.dart';
import '../models/order.dart';
import '../models/order_item.dart';
import 'input_helper.dart';

class Menu {
  final categoryRepo = CategoryRepository();
  final productRepo = ProductRepository();
  final customerRepo = CustomerRepository();
  final orderRepo = OrderRepository();
  final orderItemRepo = OrderItemRepository();

  Future<void> run() async {
    while (true) {
      print('''
======== ЗООМАГАЗИН ========

1. Категории: добавить
2. Категории: показать
3. Категории: удалить
4. Товары: добавить
5. Товары: показать
6. Товары: удалить
7. Покупатели: добавить
8. Покупатели: показать
9. Покупатели: удалить
10. Заказы: добавить
11. Заказы: показать
12. Заказы: удалить
13. Элементы заказа: добавить
14. Элементы заказа: показать
15. Элементы заказа: удалить
16. Выход
============================
''');

      final choice = InputHelper.askInt('Выберите пункт: ');

      switch (choice) {
        case 1:
          addCategory();
          break;
        case 2:
          showCategories();
          break;
        case 3:
          deleteCategory();
          break;
        case 4:
          addProduct();
          break;
        case 5:
          showProducts();
          break;
        case 6:
          deleteProduct();
          break;
        case 7:
          addCustomer();
          break;
        case 8:
          showCustomers();
          break;
        case 9:
          deleteCustomer();
          break;
        case 10:
          addOrder();
          break;
        case 11:
          showOrders();
          break;
        case 12:
          deleteOrder();
          break;
        case 13:
          addOrderItem();
          break;
        case 14:
          showOrderItems();
          break;
        case 15:
          deleteOrderItem();
          break;
        case 16:
          print('Выход...');
          return;
        default:
          print('Неверный пункт меню');
      }
    }
  }

  void addCategory() {
    final name = InputHelper.ask('Название категории: ');
    final category = Category(name: name);
    categoryRepo.create(category);
    print('Категория добавлена!');
  }

  void showCategories() {
    final list = categoryRepo.getAll();
    for (final c in list) {
      print('ID: ${c.id}, Название: ${c.name}');
    }
  }

  void deleteCategory() {
    final id = InputHelper.askInt('ID категории для удаления: ');
    categoryRepo.delete(id);
    print('Категория удалена!');
  }

  void addProduct() {
    final name = InputHelper.ask('Название товара: ');
    final price = InputHelper.askDouble('Цена: ');
    final stock = InputHelper.askInt('Количество: ');
    final categoryId = InputHelper.askInt('ID категории: ');
    
    if (!categoryRepo.exists(categoryId)) {
      print('Ошибка: Категории с таким ID не существует!');
      return;
    }

    final product = Product(name: name, price: price, stock: stock, categoryId: categoryId);
    productRepo.create(product);
    print('Товар добавлен!');
  }

  void showProducts() {
    final list = productRepo.getAll();
    for (final p in list) {
      print('ID: ${p.id}, Название: ${p.name}, Цена: ${p.price}, Кол-во: ${p.stock}, КатегорияID: ${p.categoryId}');
    }
  }

  void deleteProduct() {
    final id = InputHelper.askInt('ID товара для удаления: ');
    productRepo.delete(id);
    print('Товар удален!');
  }

  void addCustomer() {
    final firstName = InputHelper.ask('Имя: ');
    final lastName = InputHelper.ask('Фамилия: ');
    final phone = InputHelper.ask('Телефон: ');
    final email = InputHelper.ask('Email: ');
    final customer = Customer(firstName: firstName, lastName: lastName, phone: phone, email: email);
    customerRepo.create(customer);
    print('Покупатель добавлен!');
  }

  void showCustomers() {
    final list = customerRepo.getAll();
    for (final c in list) {
      print('ID: ${c.id}, ${c.firstName} ${c.lastName}, Тел: ${c.phone}, Email: ${c.email}');
    }
  }

  void deleteCustomer() {
    final id = InputHelper.askInt('ID покупателя для удаления: ');
    customerRepo.delete(id);
    print('Покупатель удален!');
  }

  void addOrder() {
    final customerId = InputHelper.askInt('ID покупателя: ');
    
    if (!customerRepo.exists(customerId)) {
      print('Ошибка: Покупателя с таким ID не существует!');
      return;
    }

    final orderDate = InputHelper.ask('Дата заказа (YYYY-MM-DD): ');
    final order = Order(customerId: customerId, orderDate: orderDate);
    orderRepo.create(order);
    print('Заказ добавлен!');
  }

  void showOrders() {
    final list = orderRepo.getAll();
    for (final o in list) {
      print('ID: ${o.id}, CustomerID: ${o.customerId}, Дата: ${o.orderDate}');
    }
  }

  void deleteOrder() {
    final id = InputHelper.askInt('ID заказа для удаления: ');
    orderRepo.delete(id);
    print('Заказ удален!');
  }

  void addOrderItem() {
    final orderId = InputHelper.askInt('ID заказа: ');
    
    if (!orderRepo.exists(orderId)) {
      print('Ошибка: Заказа с таким ID не существует!');
      return;
    }

    final productId = InputHelper.askInt('ID товара: ');
    
    if (!productRepo.exists(productId)) {
      print('Ошибка: Товара с таким ID не существует!');
      return;
    }

    final quantity = InputHelper.askInt('Количество: ');
    final item = OrderItem(orderId: orderId, productId: productId, quantity: quantity);
    orderItemRepo.create(item);
    print('Элемент заказа добавлен!');
  }

  void showOrderItems() {
    final list = orderItemRepo.getAll();
    for (final i in list) {
      print('ID: ${i.id}, OrderID: ${i.orderId}, ProductID: ${i.productId}, Кол-во: ${i.quantity}');
    }
  }

  void deleteOrderItem() {
    final id = InputHelper.askInt('ID элемента заказа для удаления: ');
    orderItemRepo.delete(id);
    print('Элемент заказа удален!');
  }
}