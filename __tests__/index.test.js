import Ajv from 'ajv';

import prettierConfig from '../src';

import prettierSchema from './prettierSchema.json';

it('Json Schema test', () => {
  const ajv = new Ajv();
  ajv.validate(prettierSchema, prettierConfig);

  expect(ajv.errors).toBeNull();
});
