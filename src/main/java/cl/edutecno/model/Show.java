package cl.edutecno.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Entity
@Setter
@Getter
@Table(name = "shows")
public class Show {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "show_id", nullable = false, unique = true)
	private Long id;
	@Size(min = 1, message = "Title must be present")
	private String showTitle;
	@Size(min = 1, message = "Network must be present")
	private String showNetwork;

	public Show() {
	}

@Getter

	// RELACIONES
// N:1 USER
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User creatorShow;
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "shows_ratings", joinColumns = @JoinColumn(name = "show_id"), inverseJoinColumns = @JoinColumn(name = "rating_id"))
	private List<Rating> ratings;

}
