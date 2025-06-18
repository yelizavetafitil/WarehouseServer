-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 18 2025 г., 16:35
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `warehouse`
--

-- --------------------------------------------------------

--
-- Структура таблицы `access_levels`
--

CREATE TABLE `access_levels` (
  `access_level_id` int(11) NOT NULL,
  `level_name` varchar(255) NOT NULL,
  `level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `access_levels`
--

INSERT INTO `access_levels` (`access_level_id`, `level_name`, `level_id`) VALUES
(1, 'Аналитик', 1),
(2, 'Рабочий', 2),
(3, 'Менеджер', 3),
(4, 'Кладовщик', 4),
(5, 'Админ', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(2, 'Инструменты'),
(3, 'Мебель');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `access_level_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`employee_id`, `email`, `password`, `position`, `access_level_id`) VALUES
(1, 'admin@ex.com', '111', 'Админн', 5),
(3, 'storekeeper@ex.com', '111', 'Кладовщик', 4),
(4, 'manager@ex.com', '111', 'Менеджер по закупкам', 3),
(5, 'worker@ex.com', '111', 'Рабочий', 2),
(6, 'analyst@ex.com', '111', 'Аналитик', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `supplier_id`, `order_date`, `status`) VALUES
(1, 1, '2025-04-09', 'В обработке'),
(2, 1, '2025-04-06', 'В обработке'),
(3, 2, '2024-07-06', 'Принят'),
(4, 3, '2024-09-07', 'Отменен');

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 1, 1, 1),
(3, 1, 5, 3),
(8, 1, 7, 2),
(10, 2, 10, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `volume` decimal(10,2) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `quantity`, `unit`, `price`, `volume`, `warehouse_id`) VALUES
(1, 2, 'Отвертка', 0, 'шт', 10.00, 2.00, 1),
(5, 3, 'Диван', 4, 'шт', 1200.00, 44.00, 2),
(6, 3, 'Стул', 0, 'шт', 10.00, 200.00, 2),
(7, 3, 'Стол', 10, 'шт', 100.00, 120.00, 1),
(8, 3, 'Стол', 0, 'шт', 123.00, 1000.00, 2),
(10, 2, 'Отвертка 2', 0, 'шт', 10.00, 0.00, 1),
(11, 3, 'Качалка', 0, 'шт', 300.00, 250.00, 1),
(12, 2, 'Стул 2', 1, 'шт', 23.00, 5.00, 3),
(13, 2, 'Стул 2', 1, 'шт', 23.00, 10.00, 3),
(14, 2, 'Стол', 0, 'шт', 100.00, 0.00, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `name`, `contact_info`) VALUES
(1, 'ИП Буров', '29232423'),
(2, 'ООО Столы', '1324353'),
(3, 'ИП Афанасьев', '13234');

-- --------------------------------------------------------

--
-- Структура таблицы `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `transaction_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `transaction_date`, `transaction_type`) VALUES
(1, '2025-04-11 15:49:34', 'Прием товаров'),
(2, '2025-04-11 15:51:11', 'Прием товаров'),
(3, '2025-04-11 15:52:57', 'Прием товаров'),
(4, '2025-04-11 15:56:54', 'Прием товаров'),
(5, '2025-04-11 15:57:16', 'Прием товаров'),
(6, '2025-04-11 15:58:00', 'Прием товаров'),
(7, '2025-04-14 15:42:45', 'Прием товаров'),
(8, '2025-04-14 15:43:22', 'Прием товаров'),
(9, '2025-04-14 16:44:46', 'Возврат товаров'),
(10, '2025-04-16 14:42:43', 'Возврат товаров'),
(11, '2025-04-16 14:45:45', 'Отгрузка товаров'),
(12, '2025-04-16 14:46:01', 'Отгрузка товаров'),
(13, '2025-04-16 14:52:19', 'Отгрузка товаров'),
(15, '2025-04-16 14:59:10', 'Отгрузка товаров'),
(16, '2025-04-16 15:02:35', 'Отгрузка товаров'),
(17, '2025-04-16 15:09:48', 'Отгрузка товаров'),
(18, '2025-04-16 15:11:15', 'Отгрузка товаров'),
(19, '2025-04-16 15:11:39', 'Отгрузка товаров'),
(20, '2025-04-22 09:29:26', 'Отгрузка товаров'),
(21, '2025-04-22 09:29:42', 'Отгрузка товаров'),
(22, '2025-04-22 09:55:52', 'Отгрузка товаров'),
(23, '2025-04-22 10:00:31', 'Отгрузка товаров'),
(24, '2025-04-22 10:05:31', 'Отгрузка товаров'),
(25, '2025-04-22 10:07:32', 'Отгрузка товаров'),
(26, '2025-04-22 10:12:32', 'Отгрузка товаров'),
(27, '2025-04-22 10:16:17', 'Отгрузка товаров'),
(28, '2025-04-22 10:21:13', 'Отгрузка товаров'),
(29, '2025-04-22 10:21:49', 'Отгрузка товаров'),
(30, '2025-04-22 20:55:03', 'Отгрузка товаров'),
(31, '2025-04-22 21:01:20', 'Отгрузка товаров'),
(32, '2025-04-22 21:05:58', 'Отгрузка товаров'),
(33, '2025-04-22 21:06:31', 'Отгрузка товаров'),
(34, '2025-04-23 12:41:11', 'Перемещение товаров'),
(35, '2025-04-23 12:45:46', 'Отгрузка товаров'),
(36, '2025-04-23 12:46:12', 'Отгрузка товаров'),
(37, '2025-04-23 12:46:42', 'Отгрузка товаров'),
(38, '2025-04-23 12:47:41', 'Отгрузка товаров'),
(39, '2025-04-23 12:49:46', 'Перемещение товаров'),
(40, '2025-04-23 12:51:31', 'Перемещение товаров'),
(41, '2025-04-23 12:54:29', 'Перемещение товаров'),
(42, '2025-04-23 12:56:08', 'Перемещение товаров'),
(43, '2025-04-23 13:03:32', 'Перемещение товаров'),
(44, '2025-04-23 13:04:09', 'Перемещение товаров'),
(45, '2025-04-23 13:06:31', 'Перемещение товаров'),
(46, '2025-04-23 13:06:43', 'Перемещение товаров'),
(47, '2025-04-23 13:08:55', 'Перемещение товаров'),
(48, '2025-04-23 13:09:00', 'Перемещение товаров'),
(49, '2025-09-08 13:24:46', 'Перемещение товаров'),
(50, '2025-04-28 16:54:04', 'Отгрузка товаров'),
(51, '2025-04-28 16:54:35', 'Перемещение товаров'),
(52, '2025-04-29 20:08:22', 'Перемещение товаров'),
(53, '2025-04-29 20:34:14', 'Отгрузка товаров'),
(54, '2025-04-29 20:37:09', 'Отгрузка товаров'),
(55, '2025-05-25 09:49:55', 'Отгрузка товаров'),
(56, '2025-05-25 09:51:03', 'Перемещение товаров');

-- --------------------------------------------------------

--
-- Структура таблицы `transactions_move_products`
--

CREATE TABLE `transactions_move_products` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `warehouse_id_past` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `transactions_move_products`
--

INSERT INTO `transactions_move_products` (`id`, `transaction_id`, `name`, `quantity`, `unit`, `price`, `volume`, `category_id`, `warehouse_id`, `warehouse_id_past`) VALUES
(1, 34, 'Стул 2', 2, 'шт', 23, 20, 2, 1, 3),
(2, 39, 'Стул 2', 2, 'шт', 23, 15, 2, 1, 2),
(3, 40, 'Стул 2', 2, 'шт', 23, 33, 2, 1, 3),
(4, 41, 'Стул 2', 3, 'шт', 23, 23, 2, 1, 2),
(5, 42, 'Стул 2', 3, 'шт', 23, 33, 2, 1, 3),
(6, 43, 'Стул 2', 3, 'шт', 23, 20, 2, 2, 1),
(7, 44, 'Стул 2', 2, 'шт', 23, 15, 2, 3, 1),
(8, 48, 'Стул 2', 2, 'шт', 23, 15, 2, 1, 2),
(9, 49, 'Стул 2', 1, 'шт', 23, 5, 2, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `transactions_reception_products`
--

CREATE TABLE `transactions_reception_products` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `transactions_reception_products`
--

INSERT INTO `transactions_reception_products` (`id`, `transaction_id`, `name`, `quantity`, `unit`, `price`, `volume`, `category_id`, `warehouse_id`) VALUES
(1, 2, 'Стулья', 2, 'уп', 3, 30, 3, 3),
(2, 3, 'Кресло', 3, 'шт', 30, 45, 3, 1),
(3, 5, 'Гвозди', 5, 'уп', 3, 30, 2, 2),
(4, 5, 'Шурупы', 6, 'уп', 34, 78, 2, 2),
(5, 6, 'Дрель', 4, 'шт', 4, 50, 2, 1),
(6, 7, 'Отвертка', 3, 'шт', 10, 2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `transactions_return_products`
--

CREATE TABLE `transactions_return_products` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `transactions_return_products`
--

INSERT INTO `transactions_return_products` (`id`, `transaction_id`, `name`, `quantity`, `unit`, `price`, `volume`, `category_id`, `warehouse_id`) VALUES
(1, 8, 'Качалка', 1, 'шт', 300, 250, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `transactions_shipment_products`
--

CREATE TABLE `transactions_shipment_products` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `volume` double DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `transactions_shipment_products`
--

INSERT INTO `transactions_shipment_products` (`id`, `transaction_id`, `name`, `quantity`, `unit`, `price`, `volume`, `category_id`, `warehouse_id`) VALUES
(1, 15, 'Отвертка', 4, 'шт', 10, 0.5, 2, 1),
(2, 16, 'Отвертка', 5, 'шт', 10, 2, 2, 1),
(3, 17, 'Отвертка', 5, 'шт', 10, 2, 2, 1),
(4, 19, 'Качалка', 1, 'шт', 300, 200, 3, 1),
(5, 21, 'Стул', 3, 'шт', 10, 200, 3, 2),
(6, 21, 'Диван', 1, 'шт', 1200, 4, 3, 2),
(7, 22, 'Качалка', 1, 'шт', 300, 250, 3, 1),
(8, 23, 'Отвертка 2', 30, 'шт', 10, 2, 2, 1),
(9, 24, 'Стол', 3, 'шт', 123, 1000, 3, 2),
(10, 25, 'Стол', 1, 'шт', 100, 20, 3, 1),
(11, 26, 'Стул 2', 2, 'шт', 23, 2, 2, 1),
(12, 27, 'Стул 2', 3, 'шт', 23, 3, 2, 1),
(13, 28, 'Стул 2', 3, 'шт', 23, 3, 2, 1),
(14, 29, 'Стул 2', 2, 'шт', 23, 2, 2, 1),
(15, 30, 'Стул 2', 3, 'шт', 23, 23, 2, 1),
(16, 31, 'Стул 2', 3, 'шт', 23, 3, 2, 1),
(17, 32, 'Стул 2', 2, 'шт', 23, 2, 2, 1),
(18, 33, 'Стул 2', 5, 'шт', 23, 55, 2, 1),
(19, 54, 'Стол', 3, 'шт', 100, 120, 2, 2),
(20, 54, 'Стул 2', 2, 'шт', 23, 10, 2, 2),
(21, 54, 'Стул 2', 1, 'шт', 23, 10, 2, 1),
(22, 55, 'Отвертка 2', 5, 'шт', 10, 2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `warehouses`
--

CREATE TABLE `warehouses` (
  `warehouse_id` int(11) NOT NULL,
  `warehouse_name` varchar(255) NOT NULL,
  `volume` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `warehouses`
--

INSERT INTO `warehouses` (`warehouse_id`, `warehouse_name`, `volume`) VALUES
(1, 'Склад 1', 1000.00),
(2, 'Склад 2', 1500.00),
(3, 'Склад 4', 2000.00);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `access_levels`
--
ALTER TABLE `access_levels`
  ADD PRIMARY KEY (`access_level_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `access_level_id` (`access_level_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Индексы таблицы `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Индексы таблицы `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Индексы таблицы `transactions_move_products`
--
ALTER TABLE `transactions_move_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `warehouse_id_past` (`warehouse_id_past`);

--
-- Индексы таблицы `transactions_reception_products`
--
ALTER TABLE `transactions_reception_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Индексы таблицы `transactions_return_products`
--
ALTER TABLE `transactions_return_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Индексы таблицы `transactions_shipment_products`
--
ALTER TABLE `transactions_shipment_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Индексы таблицы `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`warehouse_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `access_levels`
--
ALTER TABLE `access_levels`
  MODIFY `access_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `transactions_move_products`
--
ALTER TABLE `transactions_move_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `transactions_reception_products`
--
ALTER TABLE `transactions_reception_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `transactions_return_products`
--
ALTER TABLE `transactions_return_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `transactions_shipment_products`
--
ALTER TABLE `transactions_shipment_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`access_level_id`) REFERENCES `access_levels` (`access_level_id`);

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`);

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`warehouse_id`);

--
-- Ограничения внешнего ключа таблицы `transactions_move_products`
--
ALTER TABLE `transactions_move_products`
  ADD CONSTRAINT `transactions_move_products_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_move_products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_move_products_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`warehouse_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_move_products_ibfk_4` FOREIGN KEY (`warehouse_id_past`) REFERENCES `warehouses` (`warehouse_id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `transactions_reception_products`
--
ALTER TABLE `transactions_reception_products`
  ADD CONSTRAINT `transactions_reception_products_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transactions_reception_products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `transactions_reception_products_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`warehouse_id`);

--
-- Ограничения внешнего ключа таблицы `transactions_return_products`
--
ALTER TABLE `transactions_return_products`
  ADD CONSTRAINT `transactions_return_products_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_return_products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_return_products_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`warehouse_id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `transactions_shipment_products`
--
ALTER TABLE `transactions_shipment_products`
  ADD CONSTRAINT `transactions_shipment_products_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transactions_shipment_products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `transactions_shipment_products_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`warehouse_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
