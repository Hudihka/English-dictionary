//
//  Phrases.swift
//  English dictionary
//
//  Created by Админ on 13.12.2020.
//  Copyright © 2020 OOO MegaStar. All rights reserved.
//

import Foundation


class Phrases {
    
    public static let allContent: JSON = ["theme" : "Фразы", "allWords" : Phrases.words]
    
    private static let words: [JSON] = [
        ["engValue" : "nice to meet", "rusValue" : "мне тоже", "descript" : "взаимно"],
        ["engValue" : "you too", "rusValue" : "мне тоже", "descript" : "а у тебя"],
        ["engValue" : "i'm fine", "rusValue" : "прекрассно", "descript" : ""],
        ["engValue" : "thanks", "rusValue" : "спасибо", "descript" : ""],
        ["engValue" : "where are you from", "rusValue" : "откуда ты", "descript" : ""],
        ["engValue" : "what does ___ mean", "rusValue" : "что означает", "descript" : ""],
        ["engValue" : "what's __ in english", "rusValue" : "как по английски", "descript" : ""],
        ["engValue" : "sure", "rusValue" : "конечно", "descript" : ""],
        ["engValue" : "anything else", "rusValue" : "что нибудь еще", "descript" : ""],
        ["engValue" : "thanks a lot", "rusValue" : "спасибо большое", "descript" : ""],
        ["engValue" : "You're welcome", "rusValue" : "на здоровье (приходите еще) ", "descript" : ""],
        ["engValue" : " bleas you", "rusValue" : " будте здоровы", "descript" : ""],
        ["engValue" : "live in the centre of the city", "rusValue" : "жить в центре", "descript" : ""],
        ["engValue" : "work of", "rusValue" : "работать на кого", "descript" : ""],
        ["engValue" : "work in", "rusValue" : "работать где то", "descript" : ""],
        ["engValue" : "eat out", "rusValue" : "едим вне дома", "descript" : ""],
        ["engValue" : "go to", "rusValue" : "что либо делать", "descript" : ""],
        ["engValue" : "go out with", "rusValue" : "встречаться с", "descript" : ""],
        ["engValue" : "here you are", "rusValue" : "держите", "descript" : ""],
        ["engValue" : "what time is it", "rusValue" : "сколько время", "descript" : ""],
        ["engValue" : "what's the time", "rusValue" : "сколько время", "descript" : ""],
        ["engValue" : "talk about", "rusValue" : "разговаривать о", "descript" : ""],
        ["engValue" : "get up", "rusValue" : "вставать", "descript" : ""],
        ["engValue" : "start work", "rusValue" : "начало работы", "descript" : ""],
        ["engValue" : "finish work", "rusValue" : "конец работы", "descript" : ""],
        ["engValue" : "get home", "rusValue" : " возвращаться домой", "descript" : ""],
        ["engValue" : "go to bed", "rusValue" : "ложиться спать", "descript" : ""],
        ["engValue" : "take the dog for awalk", "rusValue" : "выгуливать собаку", "descript" : ""],
        ["engValue" : "certanly", "rusValue" : "конечно", "descript" : ""],
        ["engValue" : "what would you like", "rusValue" : "что желаете", "descript" : ""],
        ["engValue" : "not for me", "rusValue" : "не надо", "descript" : ""],
        ["engValue" : "of course", "rusValue" : "конечно", "descript" : ""],
        ["engValue" : "bill", "rusValue" : "счет", "descript" : ""],
        ["engValue" : "be famous for", "rusValue" : "быть чем то знаменитым", "descript" : ""],
        ["engValue" : "tell me", "rusValue" : "рассказат мне", "descript" : ""],
        ["engValue" : "to do here", "rusValue" : "делать здесь", "descript" : ""],
        ["engValue" : "in the centre of the sity", "rusValue" : "в центре города", "descript" : ""],
        ["engValue" : "pardon", "rusValue" : "паден", "descript" : ""],
        ["engValue" : "coud you say it again, please ", "rusValue" : "не могли бы вы сказать это еще раз", "descript" : ""],
        ["engValue" : "it depends", "rusValue" : "когда как/это зависит", "descript" : ""],
        ["engValue" : "is there a __ near here", "rusValue" : "есть здесь рядом", "descript" : ""],
        ["engValue" : "as king for direction", "rusValue" : "спрашивать о направлении", "descript" : ""],
        ["engValue" : "lissen to the radio", "rusValue" : "слушать радио", "descript" : ""],
        ["engValue" : "i want to buy", "rusValue" : "я хочу купить", "descript" : ""],
        ["engValue" : "I'm not sure", "rusValue" : "я не уверен", "descript" : ""],
        ["engValue" : "I don't mind", "rusValue" : "нормально отношусь", "descript" : ""],
        ["engValue" : "I got sunburn", "rusValue" : "я обгорел", "descript" : ""],
        ["engValue" : "Do you have any good ideas", "rusValue" : "есть хорошая идея", "descript" : ""],
        ["engValue" : "shall I help you", "rusValue" : " мне вам помоч", "descript" : ""],
        ["engValue" : "Why don't we __", "rusValue" : "почему бы нам не __", "descript" : ""],
        ["engValue" : "I don't think so", "rusValue" : "я так не думаю", "descript" : ""],
        ["engValue" : "each other", "rusValue" : "друг друга/друг в друга", "descript" : ""],
        ["engValue" : "raise money for chairty", "rusValue" : "собирать деньги на благотворителность", "descript" : ""],
        ["engValue" : "stay with friends", "rusValue" : "остановиться у друзей", "descript" : ""],
        ["engValue" : "go sightseeng", "rusValue" : "осматривать достопримечательности", "descript" : ""],
        ["engValue" : "didn't stay", "rusValue" : "не остановилась", "descript" : ""],
        ["engValue" : "we went sking", "rusValue" : "мы катались на лыжах", "descript" : ""],
        ["engValue" : "nothing special", "rusValue" : "ни чего особенного", "descript" : ""],
        ["engValue" : "I would", "rusValue" : "я бы ", "descript" : ""],
        ["engValue" : "I'd like", "rusValue" : "я бы хотел", "descript" : ""],
        ["engValue" : "look for", "rusValue" : "искать", "descript" : ""],
        ["engValue" : "look at", "rusValue" : "смотреть на что то", "descript" : ""],
        ["engValue" : "look after", "rusValue" : "заботиться о ком/чем", "descript" : ""],
        ["engValue" : "going to", "rusValue" : "собираться", "descript" : ""],
        ["engValue" : "ring the bell", "rusValue" : "звонить в звонок", "descript" : ""],
        ["engValue" : "at once", "rusValue" : "сразу же", "descript" : ""],
        ["engValue" : "it's time to go", "rusValue" : "пора ехать/идти", "descript" : ""],
        ["engValue" : "see you in", "rusValue" : "увидимся через", "descript" : ""],
        ["engValue" : "polka dot", "rusValue" : "в горошек", "descript" : ""],
        ["engValue" : "wash the dishes", "rusValue" : "мыть посуду", "descript" : ""],
        ["engValue" : "How much is that", "rusValue" : "сколько стоит это", "descript" : ""],
        ["engValue" : "count down", "rusValue" : "обратный отсчет", "descript" : ""],
        ["engValue" : "what's nationality are you", "rusValue" : "какой ты национальности", "descript" : ""],
        ["engValue" : "coud you", "rusValue" : "не могли бы вы", "descript" : ""],
        ["engValue" : "I would like to", "rusValue" : "я бы хотел", "descript" : ""],
        ["engValue" : "per day", "rusValue" : "в день", "descript" : ""],
        ["engValue" : "you accept", "rusValue" : "вы принимаете", "descript" : ""],
        ["engValue" : "could be better", "rusValue" : "могло быть и лучше", "descript" : ""],
        ["engValue" : "i don't care", "rusValue" : "мне все равно", "descript" : ""],
        ["engValue" : "who cares", "rusValue" : "кому какое дело", "descript" : ""],
        ["engValue" : "make a mistake", "rusValue" : "делать ошибки", "descript" : ""],
        ["engValue" : "make a call", "rusValue" : "делать звонок", "descript" : ""],
        ["engValue" : "make a friends", "rusValue" : "заводить друзей", "descript" : ""],
        ["engValue" : "make brekfast", "rusValue" : "приготовить завтрак", "descript" : ""],
        ["engValue" : "make clear", "rusValue" : "прояснить", "descript" : ""],
        ["engValue" : "do well", "rusValue" : "показывать хорош результаты", "descript" : ""],
        ["engValue" : "do badly", "rusValue" : "показывать плохие результаты", "descript" : ""],
        ["engValue" : "what kind of", "rusValue" : "какой тип", "descript" : ""],
        ["engValue" : "go out", "rusValue" : "ходить куда то развлечься", "descript" : ""],
        ["engValue" : "stay in", "rusValue" : "остаться где то", "descript" : ""],
        ["engValue" : "what shall we get", "rusValue" : "что мы ему купим", "descript" : ""],
        ["engValue" : "let's give him", "rusValue" : "давай дадим ему", "descript" : ""],
        ["engValue" : "give present", "rusValue" : "подарок", "descript" : ""],
        ["engValue" : "sounds good", "rusValue" : "звучит хорошо", "descript" : ""],
        ["engValue" : "I don't feel like it", "rusValue" : "я не чувствую что это хорошо", "descript" : ""],
        ["engValue" : "how often", "rusValue" : "как часто", "descript" : ""],
        ["engValue" : "I really like", "rusValue" : "мне очень нравится", "descript" : ""],
        ["engValue" : "I quite like", "rusValue" : "пойдет", "descript" : ""],
        ["engValue" : "what does she do", "rusValue" : "кем ты работаешь", "descript" : ""],
        ["engValue" : "what do you do", "rusValue" : "кем ты работаешь", "descript" : ""],
        ["engValue" : "what going on", "rusValue" : "что происходит", "descript" : ""],
        ["engValue" : "take path in", "rusValue" : "принимать участие", "descript" : ""],
        ["engValue" : "and so on", "rusValue" : "и.т.д.", "descript" : ""],
        ["engValue" : "looks like", "rusValue" : "выглядите как", "descript" : ""],
        ["engValue" : "what is it like", "rusValue" : "на что это похоже", "descript" : ""],
        ["engValue" : "what does he look like?", "rusValue" : "как он выглядит", "descript" : ""],
        ["engValue" : "what a shame", "rusValue" : "какая жалость", "descript" : ""],
        ["engValue" : "enter a competition", "rusValue" : "принять участие в соревнованиях", "descript" : ""],
        ["engValue" : "win a competition", "rusValue" : "выйграть в соревнованиях", "descript" : ""],
        ["engValue" : "to find", "rusValue" : "найти", "descript" : ""],
        ["engValue" : "i have a lot of things to do", "rusValue" : "у меня много дел", "descript" : ""],
        ["engValue" : "I have litle free time", "rusValue" : "у меня мало свободного времени", "descript" : ""],
        ["engValue" : "I'd rather", "rusValue" : "я бы лучше остался", "descript" : ""],
        ["engValue" : "let me know", "rusValue" : "дай мне знать", "descript" : ""],
        ["engValue" : "I'am late", "rusValue" : "я опаздываю", "descript" : ""],
        ["engValue" : "I wont her to buy", "rusValue" : "я хочу что бы ты купил", "descript" : ""],
        ["engValue" : "I wanted you to fly ", "rusValue" : "я хочу что бы ты прилетела", "descript" : ""],
        ["engValue" : "What do you want me to do", "rusValue" : "что ты хочешь что бы я сделал", "descript" : ""],
        ["engValue" : "as a rule", "rusValue" : "как правило", "descript" : ""],
        ["engValue" : "hold on", "rusValue" : "подождите", "descript" : ""],
        ["engValue" : "calling people back", "rusValue" : "перезвони", "descript" : ""],
        ["engValue" : "I'll get him/her", "rusValue" : "я ее/его приглашу", "descript" : ""],
        ["engValue" : "Do you know", "rusValue" : "ты знаешь", "descript" : ""],
        ["engValue" : "Saying who you are", "rusValue" : "говорим кто мы", "descript" : ""]
    ]
    
}
