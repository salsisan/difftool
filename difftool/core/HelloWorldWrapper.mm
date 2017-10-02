//
//  MyOCPPClass.cpp
//  difftool
//
//  Created by Yasser Elsayed on 10/2/17.
//  Copyright © 2017 Yasser Elsayed. All rights reserved.
//

#import "HelloWorldWrapper.h"
#include "HelloWorld.hpp"

@implementation HelloWorldWrapper

- (void)say_hello {
  HelloWorld hello;
  hello.say_hello();
}

@end
