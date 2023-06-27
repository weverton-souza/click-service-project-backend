
package com.click.service.project.repository

import com.click.service.project.domain.User
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager
import org.springframework.test.context.ActiveProfiles

@DataJpaTest
@ActiveProfiles("test")
class UserRepositoryTest(
    @Autowired val entityManager: TestEntityManager,
    @Autowired val userRepository: UserRepository
) {

    @Test
    fun `when findById then return User`() {
        val user = User(name = "weverton")
        val saveUser = this.entityManager.persist(user)
        this.entityManager.flush()

        val foundUser = this.userRepository.findById(saveUser.id!!).get()

        assertNotNull(foundUser)
        assertNotNull(foundUser.id)
        assertEquals(foundUser.name, user.name)
    }
}
