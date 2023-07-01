 package com.pedia.beach.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class PageCreator {

	private PageVO paging;
	private int articleTotalCount, beginPage, endPage;
	private boolean prev, next;

	private final int buttonNum = 5;

	public PageCreator(PageVO paging, int articleTotalCount) {
		this.paging = paging;
		this.articleTotalCount = articleTotalCount;
		calcDataOfPage();
	}

	private void calcDataOfPage() {
		endPage = (int) Math.ceil(paging.getPageNum() / (double) buttonNum) * buttonNum;
		beginPage = endPage - buttonNum + 1;
		prev = (beginPage == 1 ? false : true);
		next = (endPage * paging.getCpp() >= articleTotalCount ? false : true);

		if(!next) {
			endPage = (int) Math.ceil(articleTotalCount / (double) paging.getCpp());
		}
	}



}
