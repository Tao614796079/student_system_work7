package com.biz.std.vo;

/**
 * Created by Administrator on 2017/5/9.
 */
public class Score {
    private int subjectId;
    private float score;

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Score{");
        sb.append("subjectId=").append(subjectId);
        sb.append(", score=").append(score);
        sb.append('}');
        return sb.toString();
    }
}
