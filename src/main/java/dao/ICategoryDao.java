package dao;

import model.Category;

import java.util.Date;
import java.util.List;

public interface ICategoryDao {
    public int insertCategory(Category category);

    public int updateCategory(Category category);

    public int deleteCategory(int num);

    public Category selectOne(int num);

    public List<Category> selectAll();

    public int getCategoryCount();
}
