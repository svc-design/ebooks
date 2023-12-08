# 概述


Vue 3 是一个流行的前端 JavaScript 框架，用于构建用户界面和单页应用程序。以下是 Vue 3 的基本语法和一些示例代码。

## vue 文件结构

Vue 3 组件通常在 .vue 文件中定义，包括三个部分：<template>, <script>, <style>。

```vue
Copy code
<template>
  <!-- HTML 模版 -->
</template>

<script>
export default {
  // JavaScript 逻辑
};
</script>

<style>
/* CSS 样式 */
</style>
```

## 生命周期钩子

Vue 组件有多个生命周期钩子，例如：

created(): 组件实例被创建后调用。

mounted(): 组件挂载到 DOM 上后调用。

```javascript
Copy code
export default {
  created() {
    // 组件创建后的逻辑
  },
  mounted() {
    // 组件挂载后的逻辑
  }
};
```

## 模板语法

Vue 使用基于 HTML 的模板语法，允许你声明式地将 DOM 绑定到底层组件实例的数据。

- v-for: 列表渲染
- v-if, v-show: 条件渲染
- v-on: 监听 DOM 事件
- v-model: 创建双向数据绑定

```
<template>
  <div v-for="item in items" :key="item.id">
    {{ item.text }}
  </div>
</template>
```

## 组件

组件是 Vue 应用的基本构建块。

注册组件:

```
import MyComponent from './MyComponent.vue';

export default {
  components: {
    MyComponent
  }
};
```

## 组件通讯:

父组件 -> 子组件: 通过 props 传递数据。

子组件 -> 父组件: 通过自定义事件。

兄弟组件通信: 使用 Vuex 或 Pinia（Vuex 的替代品）。

## Composition API

在 Vue 3 中，<script setup> 是一个编译时语法糖，用于使组件的编写更加简洁和直观。这种语法的核心优点是减少样板代码，并直接使用 Composition API。它也提供了更好的类型推断支持，特别是在使用 TypeScript 时。

<script setup> 语法

在 <script setup> 中，你可以直接定义组件的逻辑，而不需要像传统的 <script> 那样导出一个对象。这简化了代码结构，使其更易于阅读和维护。

```
<script setup>
import { ref, onMounted } from 'vue';

const count = ref(0);

function increment() {
  count.value++;
}

onMounted(() => {
  console.log('组件已挂载');
});
</script>
```

- 响应式编程
Vue 3 使用 Composition API 提供了更灵活的方式来组合和重用逻辑。ref 和 reactive 是两个基本的响应式 API。

ref: 用于定义一个响应式的数据引用。

const count = ref(0);

你可以通过 count.value 来获取或设置该数据的值。

reactive: 用于创建一个响应式的对象。

```
const state = reactive({ count: 0 });
```

可以直接通过 state.count 访问和修改属性。

示例代码

```
<template>

  <button @click="increment">点击我</button>

  <p>计数: {{ count }}</p>

</template>

<script setup>

import { ref } from 'vue';

const count = ref(0);

function increment() {

  count.value++;

}

</script>

<style>

p {

  color: red;

}

</style>
```

在 Vue 3 中，虽然 <script setup> 语法提供了一个更简洁的方式来使用 Composition API，但有时你可能想保持清晰的代码结构，比如通过明确地导出组件选项。这可以通过结合使用 <script setup> 和传统的 <script> 标签来实现。

这种方法允许你从 <script setup> 中导出响应式状态和函数，同时保持 <script> 中对组件的配置和声明周期钩子的访问。

示例代码

以下是一个示例，展示了如何在 Vue 3 组件中结合使用 <script setup> 和 <script>。

```
<template>

  <button @click="increment">点击我</button>

  <p>计数: {{ count }}</p>

</template>

<script setup>

import { ref } from 'vue';

const count = ref(0);

function increment() {

  count.value++;

}

export { count, increment };

</script>

<script>

export default {

  name: 'CounterComponent',

  // 更多的组件选项...

  mounted() {
console.log('组件已挂载');

  }

};
</script>

<style>
p {
  color: green;
}
</style>
```

在这个例子中：

<script setup>: 我们定义了一个响应式引用 count 和一个方法 increment。这两者都被导出，使得它们可以在 <script> 标签外部使用。

<script>: 我们定义了组件的名称和其它选项，如生命周期钩子 mounted。

这种结合使用两种脚本的方法提供了灵活性，允许你在使用 Composition API 的同时，保持组件的清晰和结构化。这在大型项目或需要更细致组织代码的情况下特别有用。

## 扩展

- 路由: 使用 vue-router 创建单页应用程序的路由。
- Ajax 请求: 使用 axios 发送 HTTP 请求。
- UI 组件库: 如 Element UI 提供现成的 Vue 组件。
- 后端集成: 可以与 Koa 或 Express 等 Node.js 框架集成。

# 示例代码

```vue
Copy code
<template>
  <button @click="increment">点击我</button>
  <p>计数: {{ count }}</p>
</template>

<script>
export default {
  data() {
    return {
      count: 0
    };
  },
  methods: {
    increment() {
      this.count += 1;
    }
  }
};
</script>

<style>
p {
  color: blue;
}
</style>
```

这个简单的示例展示了一个按钮，点击它会增加计数，并在页面上显示。这涵盖了组件的基本结构、事件处理和响应式数据绑定的概念。
