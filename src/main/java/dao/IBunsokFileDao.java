package dao;

import model.BunsokFile;

public interface IBunsokFileDao {
    public int insertBunsokFile(BunsokFile bunsokFile);

    public int updateBunsokFile(BunsokFile bunsokFile);

    public int deleteBunsokFile(int fId);

    public BunsokFile selectBunsokFile(int fId);
}
