package cl.edutecno.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import cl.edutecno.model.Rating;

@Repository
public interface RatingRepository extends JpaRepository<Rating, Long> {
	
	Rating findRatingById(Long id);
	
	Rating findFirstByOrderByIdDesc();
	
	List<Rating> findAllRatingByShowId(Long id);
	
	Rating findRatingByUserId(Long id);
	
}
