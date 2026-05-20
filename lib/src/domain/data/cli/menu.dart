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
2. Категории: показать все
3. Категории: найти по ID
4. Категории: удалить

5. Товары: добавить
6. Товары: показать все
7. Товары: найти по ID
8. Товары: удалить

9. Покупатели: добавить
10. Покупатели: показать все
11. Покупатели: найти по ID
12. Покупатели: удалить

13. Заказы: добавить
14. Заказы: показать все
15. Заказы: найти по ID
16. Заказы: удалить

17. Элементы заказа: добавить
18. Элементы заказа: показать все
19. Элементы заказа: найти по ID
20. Элементы заказа: удалить

21. Выход
============================
''');

      final choice = InputHelper.askInt('Выберите пункт: ');

      switch (choice) {
        case 1: addCategory(); break;
        case 2: showCategories(); break;
        case 3: searchCategory(); break;
        case 4: deleteCategory(); break;
        
        case 5: addProduct(); break;
        case 6: showProducts(); break;
        case 7: searchProduct(); break;
        case 8: deleteProduct(); break;
        
        case 9: addCustomer(); break;
        case 10: showCustomers(); break;
        case 11: searchCustomer(); break;
        case 12: deleteCustomer(); break;
        
        case 13: addOrder(); break;
        case 14: showOrders(); break;
        case 15: searchOrder(); break;
        case 16: deleteOrder(); break;
        
        case 17: addOrderItem(); break;
        case 18: showOrderItems(); break;
        case 19: searchOrderItem(); break;
        case 20: deleteOrderItem(); break;
        
        case 21:
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
    if (list.isEmpty) print('Список категорий пуст.');
    for (final c in list) {
      print('ID: ${c.id}, Название: ${c.name}');
    }
  }

  void searchCategory() {
    final id = InputHelper.askInt('ID категории для поиска: ');
    final category = categoryRepo.getById(id);
    if (category != null) {
      print('[Найдено] ID: ${category.id}, Название: ${category.name}');
    } else {
      print('Категория с ID $id не найдена.');
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
    if (list.isEmpty) print('Список товаров пуст.');
    for (final p in list) {
      print('ID: ${p.id}, Название: ${p.name}, Цена: ${p.price}, Кол-во: ${p.stock}, КатегорияID: ${p.categoryId}');
    }
  }

  void searchProduct() {
    final id = InputHelper.askInt('ID товара для поиска: ');
    final p = productRepo.getById(id);
    if (p != null) {
      print('[Найдено] ID: ${p.id}, Название: ${p.name}, Цена: ${p.price}, Кол-во: ${p.stock}, КатегорияID: ${p.categoryId}');
    } else {
      print('Товар с ID $id не найден.');
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
    if (list.isEmpty) print('Список покупателей пуст.');
    for (final c in list) {
      print('ID: ${c.id}, ${c.firstName} ${c.lastName}, Тел: ${c.phone}, Email: ${c.email}');
    }
  }

  void searchCustomer() {
    final id = InputHelper.askInt('ID покупателя для поиска: ');
    final c = customerRepo.getById(id);
    if (c != null) {
      print('[Найдено] ID: ${c.id}, ${c.firstName} ${c.lastName}, Тел: ${c.phone}, Email: ${c.email}');
    } else {
      print('Покупатель с ID $id не найден.');
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
    if (list.isEmpty) print('Список заказов пуст.');
    for (final o in list) {
      print('ID: ${o.id}, CustomerID: ${o.customerId}, Дата: ${o.orderDate}');
    }
  }

  void searchOrder() {
    final id = InputHelper.askInt('ID заказа для поиска: ');
    final o = orderRepo.getById(id);
    if (o != null) {
      print('[Найдено] ID: ${o.id}, CustomerID: ${o.customerId}, Дата: ${o.orderDate}');
    } else {
      print('Заказ с ID $id не найден.');
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
    if (list.isEmpty) print('Список элементов заказов пуст.');
    for (final i in list) {
      print('ID: ${i.id}, OrderID: ${i.orderId}, ProductID: ${i.productId}, Кол-во: ${i.quantity}');
    }
  }

  void searchOrderItem() {
    final id = InputHelper.askInt('ID элемента заказа для поиска: ');
    final i = orderItemRepo.getById(id);
    if (i != null) {
      print('[Найдено] ID: ${i.id}, OrderID: ${i.orderId}, ProductID: ${i.productId}, Кол-во: ${i.quantity}');
    } else {
      print('Элемент заказа с ID $id не найден.');
    }
  }

  void deleteOrderItem() {
    final id = InputHelper.askInt('ID элемента заказа для удаления: ');
    orderItemRepo.delete(id);
    print('Элемент заказа удален!');
  }
}