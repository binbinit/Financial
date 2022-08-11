<template>
  <div class="personal-main">
    <div class="personal-money">
      <h3><i>借款记录</i></h3>

      <div class="personal-moneylist" style="margin-top: 40px;">
        <div class="pmain-contitle">
          <span class="pmain-title1 fb" style="width: 150px;">
            借款金额
          </span>
          <span class="pmain-title2 fb" style="width: 70px;">
            年利率
          </span>
          <span class="pmain-title3 fb" style="width: 100px;">
            借款期限
          </span>
          <span class="pmain-title1 fb" style="width: 300px;">备注</span>
        </div>
        <ul>
          <li
            v-for="transFlow in transFlowList"
            :key="transFlow.id"
            style="width:100%"
          >
            <span class="pmain-title1 pmain-height" style="width: 150px;">
              {{ transFlow.createTime }}
            </span>
            <span class="pmain-title2 pmain-height" style="width: 70px;">
              {{ transFlow.transTypeName }}
            </span>
            <span class="pmain-title3 pmain-height" style="width: 100px;">
              {{ transFlow.transAmount }}
            </span>
            <span
              :title="transFlow.memo"
              class="pmain-title1 pmain-height"
              style="width: 500px; overflow: hidden;"
            >
              {{ transFlow.memo }}
            </span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
 data() {
    return {
      transFlowList: [],
    };
  },
};
</script>