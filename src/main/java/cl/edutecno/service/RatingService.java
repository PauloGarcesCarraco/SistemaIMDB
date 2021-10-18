package cl.edutecno.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cl.edutecno.model.Rating;
import cl.edutecno.repository.RatingRepository;

@Service
public class RatingService {
	@Autowired
	private RatingRepository ratingRepository;

	public List<Rating> findAllRatings() {
		return ratingRepository.findAll();
	}

	public Rating findRatingById(Long id) {
		return ratingRepository.findRatingById(id);
	}

	public void addRating(Rating rating) {
		ratingRepository.save(rating);
	}
	
	public Rating findFirstByOrderByIdDesc() {
		return ratingRepository.findFirstByOrderByIdDesc();
	}
	
	public List<Rating> findAllRatingByShowId(Long id){
		return ratingRepository.findAllRatingByShowId(id);
	}
	
	public Rating findRatingByUserId(Long id) {
		return ratingRepository.findRatingByUserId(id);
	}
	
	
}
