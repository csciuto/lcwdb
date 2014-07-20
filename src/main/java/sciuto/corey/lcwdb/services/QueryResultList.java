package sciuto.corey.lcwdb.services;

import java.util.List;

public class QueryResultList<T> {
	
	private List<T> results;
	private boolean isTruncated;
	
	public List<T> getResults() {
		return results;
	}
	public void setResults(List<T> results) {
		this.results = results;
	}
	public boolean isTruncated() {
		return isTruncated;
	}
	public void setTruncated(boolean isTruncated) {
		this.isTruncated = isTruncated;
	}
}
