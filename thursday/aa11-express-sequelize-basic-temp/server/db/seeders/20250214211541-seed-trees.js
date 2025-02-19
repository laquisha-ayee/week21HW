'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.bulkInsert('Trees', [
      {
        id: 1,
        tree: 'General Sherman',
        location: 'Sequoia National Park',
        heightFt: 274.9,
        groundCircumferenceFt: 102.6,
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        id: 2,
        tree: 'General Grant',
        location: 'Kings Canyon National Park',
        heightFt: 268.1,
        groundCircumferenceFt: 107.5,
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        id: 3,
        tree: 'President',
        location: 'Sequoia National Park',
        heightFt: 240.9,
        groundCircumferenceFt: 93.0,
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        id: 4,
        tree: 'Lincoln',
        location: 'Sequoia National Park',
        heightFt: 255.8,
        groundCircumferenceFt: 98.3,
        createdAt: new Date(),
        updatedAt: new Date()
      },
      {
        id: 5,
        tree: 'Stagg',
        location: 'Private Land',
        heightFt: 243.0,
        groundCircumferenceFt: 109.0,
        createdAt: new Date(),
        updatedAt: new Date()
      }
    ], {});
  },

  async down(queryInterface, Sequelize) {
    await queryInterface.bulkDelete('Trees', null, {});
  }
};

