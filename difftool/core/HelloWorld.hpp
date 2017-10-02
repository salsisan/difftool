//
//  SomeCPPHeader.hpp
//  difftool
//
//  Created by Yasser Elsayed on 10/2/17.
//  Copyright © 2017 Yasser Elsayed. All rights reserved.
//

#ifndef HelloWorld_h
#define HelloWorld_h

#include <stdio.h>
#include <iostream>

class HelloWorld {
public:
  HelloWorld() {
    std::cout << "This is the constructor.\n";
  }

  void say_hello();
};

#endif /* HelloWorld_h */
