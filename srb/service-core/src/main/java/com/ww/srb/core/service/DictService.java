package com.ww.srb.core.service;

import com.ww.srb.core.pojo.dto.ExcelDictDTO;
import com.ww.srb.core.pojo.entity.Dict;
import com.baomidou.mybatisplus.extension.service.IService;

import java.io.InputStream;
import java.util.List;

/**
 * <p>
 * 数据字典 服务类
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface DictService extends IService<Dict> {
    void importData(InputStream inputStream);

    List listDictData();

    List<Dict> listByParentId(Long parentId);

    // 根据dictCode获取下级节点
    List<Dict> findByDictCode(String dictCode);

    // 查询下拉列表内容
    String getNameByParentDictCodeAndValue(String dictCode, Integer value);
}
