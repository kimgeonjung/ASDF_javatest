package boards;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class BoardsDTO {
	private int id;
	private String writer;
	private String title;
	private String content;
	private String regtime;
	private int hits;
}
