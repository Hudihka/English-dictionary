//
//  NotTheme.swift
//  English dictionary
//
//  Created by Hudihka on 01/12/2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import Foundation

class NotTheme {
	
	public static let allContent: JSON = ["theme" : "Без темы", "allWords" : NotTheme.words]
	
	private static let words: [JSON] = [
        ["engValue" : "art", "rusValue" : "искусство", "descript" : ""],
        ["engValue" : "science", "rusValue" : "точные науки", "descript" : ""],
        ["engValue" : "maths", "rusValue" : "математика", "descript" : ""],
        ["engValue" : "band", "rusValue" : "музыкальная группа", "descript" : ""],
        ["engValue" : "a pencil", "rusValue" : "карандаш", "descript" : ""],
        ["engValue" : "a bag", "rusValue" : "рюкзак", "descript" : ""],
        ["engValue" : "consonauts", "rusValue" : "согласные", "descript" : ""],
        ["engValue" : "vowels", "rusValue" : "гласные", "descript" : ""],
        ["engValue" : "an answer", "rusValue" : "ответ", "descript" : ""],
        ["engValue" : "qwestion", "rusValue" : "вопрос", "descript" : ""],
        ["engValue" : "mean ", "rusValue" : "означает", "descript" : ""],
        ["engValue" : "exercise", "rusValue" : "упражнение", "descript" : ""],
        ["engValue" : "vocablurary", "rusValue" : "словарь", "descript" : ""],
        ["engValue" : "plurars", "rusValue" : "множественное число", "descript" : ""],
        ["engValue" : "a singer", "rusValue" : "певец/певица", "descript" : ""],
        ["engValue" : "a waiter", "rusValue" : "официант", "descript" : ""],
        ["engValue" : "a waitress", "rusValue" : "официантка", "descript" : ""],
        ["engValue" : "pounds", "rusValue" : "фунт стерлингов", "descript" : ""],
        ["engValue" : "languages", "rusValue" : "языки", "descript" : ""],
        ["engValue" : "order", "rusValue" : "заказ", "descript" : ""],
        ["engValue" : "adverbs", "rusValue" : "начечие", "descript" : ""],
        ["engValue" : "busy", "rusValue" : "занятой", "descript" : ""],
        ["engValue" : "modern", "rusValue" : "современный", "descript" : ""],
        ["engValue" : "many", "rusValue" : "много", "descript" : ""],
        ["engValue" : "around", "rusValue" : "вокруг", "descript" : ""],
        ["engValue" : "breed", "rusValue" : "порода", "descript" : ""],
        ["engValue" : "private", "rusValue" : "рядовой", "descript" : ""],
        ["engValue" : "colour", "rusValue" : "цвет", "descript" : ""],
        ["engValue" : "something", "rusValue" : "что либо", "descript" : ""],
        ["engValue" : "lesson", "rusValue" : "урок", "descript" : ""],
        ["engValue" : "memory", "rusValue" : "память", "descript" : ""],
        ["engValue" : "firework", "rusValue" : "салют", "descript" : ""],
        ["engValue" : "classmate", "rusValue" : "одногрупнки", "descript" : ""],
        ["engValue" : "mate", "rusValue" : "товарищ/приятель", "descript" : ""],
        ["engValue" : "first", "rusValue" : "первый", "descript" : ""],
        ["engValue" : "second", "rusValue" : "второй", "descript" : ""],
        ["engValue" : "third", "rusValue" : "третий", "descript" : ""],
        ["engValue" : "fifth", "rusValue" : "пятый", "descript" : ""],
        ["engValue" : "past", "rusValue" : "предлог", "descript" : ""],
        ["engValue" : "country", "rusValue" : "исключение", "descript" : ""],
        ["engValue" : "shout", "rusValue" : "кричать", "descript" : ""],
        ["engValue" : "hole", "rusValue" : "отверстие", "descript" : ""],
        ["engValue" : "noise", "rusValue" : "шум", "descript" : ""],
        ["engValue" : "flowers", "rusValue" : "цветок", "descript" : ""],
        ["engValue" : "movie", "rusValue" : "фильм", "descript" : ""],
        ["engValue" : "pet", "rusValue" : "домашние животные", "descript" : ""],
        ["engValue" : "enjoy", "rusValue" : "получать удовольствие", "descript" : ""],
        ["engValue" : "exiting", "rusValue" : "впечатление", "descript" : ""],
        ["engValue" : "congratulation", "rusValue" : "поздравляю", "descript" : ""],
        ["engValue" : "fool", "rusValue" : "дурак", "descript" : ""],
        ["engValue" : "gone", "rusValue" : "ущел", "descript" : ""],
        ["engValue" : "hole", "rusValue" : "дыра", "descript" : ""],
        ["engValue" : "solution", "rusValue" : "решение", "descript" : ""],
        ["engValue" : "novel", "rusValue" : "роман", "descript" : ""],
        ["engValue" : "stuck", "rusValue" : "застрял", "descript" : ""],
        ["engValue" : "owl", "rusValue" : "птица", "descript" : ""],
        ["engValue" : "keep", "rusValue" : "продолжаем", "descript" : ""],
        ["engValue" : "aloud", "rusValue" : "в слух", "descript" : ""],
        ["engValue" : "teste", "rusValue" : "вкус", "descript" : ""],
        ["engValue" : "peel", "rusValue" : "кожура", "descript" : ""],
        ["engValue" : "hope", "rusValue" : "надежда", "descript" : ""],
        ["engValue" : "rest", "rusValue" : "остальное", "descript" : ""],
        ["engValue" : "glass", "rusValue" : "стакан", "descript" : ""],
        ["engValue" : "the navy", "rusValue" : "военно морской флот", "descript" : ""],
        ["engValue" : "kind", "rusValue" : "тип/вид", "descript" : ""],
        ["engValue" : "become", "rusValue" : "становиться/случаться", "descript" : ""],
        ["engValue" : "apiece", "rusValue" : "кусок", "descript" : ""],
        ["engValue" : "stamps", "rusValue" : "марки", "descript" : ""],
        ["engValue" : "noun", "rusValue" : "существительное", "descript" : ""],
        ["engValue" : "a void", "rusValue" : "избежать", "descript" : ""],
        ["engValue" : "discount", "rusValue" : "скидка", "descript" : ""],
        ["engValue" : "article", "rusValue" : "статья", "descript" : ""],
        ["engValue" : "free", "rusValue" : "бесплатно", "descript" : ""],
        ["engValue" : "confinement", "rusValue" : "заключение", "descript" : ""],
        ["engValue" : "freedom", "rusValue" : "свобода", "descript" : ""],
        ["engValue" : "independence", "rusValue" : "независимость", "descript" : ""],
        ["engValue" : "fight", "rusValue" : "борьба", "descript" : ""],
        ["engValue" : "cartoons", "rusValue" : "мультики", "descript" : ""],
        ["engValue" : "jokinn", "rusValue" : "шутка", "descript" : ""],
        ["engValue" : "shame", "rusValue" : "стыд", "descript" : ""],
        ["engValue" : "prize", "rusValue" : "приз", "descript" : ""],
        ["engValue" : "a certificat", "rusValue" : "сертификат", "descript" : ""],
        ["engValue" : "recognition", "rusValue" : "признание", "descript" : ""],
        ["engValue" : "queue", "rusValue" : "очередь", "descript" : ""],
        ["engValue" : "weater", "rusValue" : "погода", "descript" : ""],
        ["engValue" : "arrive", "rusValue" : "прибытие", "descript" : ""],
        ["engValue" : "prossive", "rusValue" : "принадлежность", "descript" : ""],
        ["engValue" : "climb", "rusValue" : "наводнение", "descript" : ""],
        ["engValue" : "a helicopter", "rusValue" : "вертолет", "descript" : ""],
        ["engValue" : "hear", "rusValue" : "слышать", "descript" : ""],
        ["engValue" : "science - fiction", "rusValue" : "научная фантастика", "descript" : ""],
        ["engValue" : "syllable", "rusValue" : "слог", "descript" : ""],
        ["engValue" : "consonant", "rusValue" : "согл", "descript" : ""],
        ["engValue" : "vowel", "rusValue" : "гласный", "descript" : ""],
        ["engValue" : "comparatives", "rusValue" : "сравнит степень", "descript" : ""],
        ["engValue" : "worse", "rusValue" : "шудший", "descript" : ""],
        ["engValue" : "brakets", "rusValue" : "скобки", "descript" : ""],
        ["engValue" : "atmosphere", "rusValue" : "атмосфера", "descript" : ""],
        ["engValue" : "myt", "rusValue" : "миф", "descript" : ""],
        ["engValue" : "stranger", "rusValue" : "посторонний", "descript" : ""],
        ["engValue" : "a meeting", "rusValue" : "встреча", "descript" : ""],
        ["engValue" : "sign", "rusValue" : "знак", "descript" : ""],
        ["engValue" : "accident", "rusValue" : "авария/ несчастный случай", "descript" : ""],
        ["engValue" : "space", "rusValue" : "пространство", "descript" : ""]
	]
	
}
