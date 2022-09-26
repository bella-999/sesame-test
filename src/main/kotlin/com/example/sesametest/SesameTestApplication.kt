package com.example.sesametest

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@SpringBootApplication
class SesameTestApplication

fun main(args: Array<String>) {
    runApplication<SesameTestApplication>(*args)
}

@RestController
class testApi() {
    @GetMapping
    fun test() : String{
        return "hello world2"
    }
}