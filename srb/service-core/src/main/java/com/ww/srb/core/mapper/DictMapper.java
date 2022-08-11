package com.ww.srb.core.mapper;

import com.ww.srb.core.pojo.dto.ExcelDictDTO;
import com.ww.srb.core.pojo.entity.Dict;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 数据字典 Mapper 接口
 * </p>
 *
 * @author ww
 * @since 2022-08-06
 */
public interface DictMapper extends BaseMapper<Dict> {
    void insertBatch(List<ExcelDictDTO> list);
}
