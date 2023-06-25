package com.click.service.project

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.data.jpa.repository.config.EnableJpaRepositories

@SpringBootApplication
@EnableJpaRepositories
class ClickServiceProjectBackendApplication

fun main(args: Array<String>) {
    runApplication<ClickServiceProjectBackendApplication>(*args)
}
