package com.board.db;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class Pagination {
    private String display;
    private int pageNo;
    private boolean curPage;
   
}
